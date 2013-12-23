/*
 * nginuous
 * (c) 2014 by TASTENWERK
 * license: GPLv3
 *
 */

/**
 * PRIVATE METHODS
 *
 */
function getValidRoutePath( prefix, route ){
  var pth = prefix + route;
  if( pth.lastIndexOf('/') === pth.length-1 )
    pth = pth.substr(0,pth.length-1);
  return pth;
}


/**
 * Controller
 *
 * a route controller
 *
 * @example:
 *
 *    new Controller( function(){
 *      this.get('/', function( req, es ){});
 */
var Controller = function(){
  this.routes = { get: {}, put: {}, delete: {}, post: {} };
  this.hooks = { before: [] };
};

Controller.define = function( definitionsCallback ){
  return function( prefix, name, app ){
    var controller = new Controller();
    for( var i in controller )
      this[i] = controller[i];
    this.name = name;
    definitionsCallback.call( this, app, prefix );
    this.initRoutes( prefix, app );
  }
}

/**
 * initializes express routes
 *
 * @api private
 */
Controller.prototype.initRoutes = function initRoutes( prefix, app ){
  for( var routeType in this.routes ){
    for( var route in this.routes[routeType] ){
      var args = [ getValidRoutePath(prefix,route) ];
      args = args.concat( this.getBeforeHooks( route ) );
      var hsh = this.routes[routeType][route];
      for( var i in hsh )
        if( parseInt(i) > 0 )
          args.push( hsh[i] );
      app.express[routeType].apply( app.express, args );
    }
  }
}

/**
 * get before hooks
 *
 * @param {String} - route name
 * @return {Array} - the collected functions for the hook
 *
 * @api private
 */
Controller.prototype.getBeforeHooks = function getBeforeHooks( routeName ){
  var hooks = [];
  this.hooks.before.forEach( function(hook){
    if(!( hook.exceptions && hook.exceptions.indexOf(routeName) >= 0 ) )
      hooks.push( hook.fn );
  });
  return hooks;
}

/**
 * a get route
 */
Controller.prototype.get = function get( name ){
  this.routes.get[name] = arguments;
}

/**
 * a post route
 */
Controller.prototype.post = function post( name ){
  this.routes.post[name] = arguments;
}

/**
 * a put route
 */
Controller.prototype.put = function put( name ){
  this.routes.put[name] = arguments;
}

/**
 * a delete route
 */
Controller.prototype.delete = function deletePath( name ){
  this.routes.delete[name] = arguments;
}

/**
 * before hook
 */
Controller.prototype.before = function before(){
  var self = this;
  var exceptions = [];
  for( var i in arguments ){
    var arg = arguments[i];
    if( typeof(arg) === 'object' && 'except' in arg ){
      if( typeof(arg.except) === 'array' )
        arg.except.forEach( function(exc){
          exceptions.push( exc );
        });
      else
        exceptions.push( arg.except )
    }
  }
  var foundFn;
  for( var i in arguments )
    if( typeof(arguments[i]) === 'function' ){
      foundFn = true;
      this.hooks.before.push({
        exceptions: exceptions,
        fn: arguments[i]
      });
    }

  if( !foundFn )
    throw Error( '[nginuous] ' + this.name + ': call of before hook without passing a function. This might not be what you are after (?)' )

}


module.exports = Controller;