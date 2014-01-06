/*
 * nginios
 * (c) 2014 by TASTENWERK
 * license: GPLv3
 *
 */

var fs = require('fs')
  , path = require('path')
  , defaults = require('./defaults')
  , Server = require('./server')
  , db = require('./db')
  , Connection = db.Connection
  , modelRegistry = db.modelRegistry
  , logger = require('./logger')
  , Gear = require('./gear')
  , GearFactory = require('./gear_factory')
  , router = require('./router')
  , gearRegistry = require('./gear_registry');

/**
 * creates the main instance
 * to run an nginios application
 * 
 * @class Application
 * @constructor
 *
 * @param {Object} options an options object
 * @param {Number} options.port port number to start application on
 *
 * @private
 *
 */
function Application( options ){

  // make the application caller a gear (unless testing env)
  if( process.env.NODE_ENV !== 'test' )
    new Gear({ absolutePath: process.cwd() });

  // make nginios itself a gear
  new Gear({
    absolutePath: path.normalize( path.join( __dirname, '..', '..' ) ),
    app_paths: {
      v1: [
        { name: 'admin', path: 'admin', icon: 'gears', require_manager: true, position: 999 },
        { name: 'dashboard', path: 'dashboard', icon: 'home', position: 0 }
      ]
    }
  });

  var self = this;

  this.environment = process.env.NODE_ENV || 'development';

  if( this.environment === 'test' )
    this.config = require(process.cwd()+'/test/support/environment.js')( defaults( options ) );
  else
    this.config = require(process.cwd()+'/config/environments/'+this.environment)( defaults( options ) );

  logger.init( this.config );

  // initialize all gears and read in
  // their directories
  initGears( this );

  // database initialization
  this.db = new Connection( this.config );

  // open connection and continue
  // when done or failed
  this.db.open();

  /**
   * Array of gears which have been associated and loaded
   * with this application
   *
   * @property gears
   * @type Array
   **/
  this.gears;

  /**
   *
   * references the original expressjs object which is
   * instantiated by new Application(), resp. calling
   * nginios();
   * 
   * @property express
   * @type Object
   **/
  this.express;

  // instanciate Server
  this.server = new Server( this );

  this.server.webSetup( function(){
    router.init( self );
  });

}


/**
 * init gears
 * 
 * must have been registered up till now:
 * @example:
 *
 * var Gear = require('nginios').Gear
 * var myGear = new Gear(...);
 * ...
 *
 * @api private
 */
function initGears( app ){
  app.gears = gearRegistry;
  GearFactory.app = app;
  for( var i in app.gears )
    GearFactory.process( app.gears[i] );
}

module.exports = Application;