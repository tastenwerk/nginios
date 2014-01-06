/*
 * nginios
 * (c) 2014 by TASTENWERK
 * license: GPLv3
 *
 */

var logger = require('./logger')
  , S = require('string')
  , path = require('path')
  , controllerRegistry = require('./controller_registry');


var router = {};
var routesOrder = {};

/**
 * setup routes
 *
 * @example
 *
 *    router.add( '/users', 'users' );
 *
 */
router.add = function addRoute( url, controller ){
  if( arguments.length === 1 ){
    controller = url;
    url = '/'+controller;
  }
  if( !controller || !( controller in controllerRegistry.controllers ) )
    throw new Error('unknown controller name: ' + controller + ' url: ' + url);
  routesOrder[url] = controller;
}

/**
 * initializes routes
 *
 * @param {Application} the nginios instantiated application
 *
 * @api private
 *
 */
router.init = function initRoutes( app ){
  for( var i in routesOrder ){
    new controllerRegistry.controllers[routesOrder[i]].controller( i, controllerRegistry.controllers[routesOrder[i]].gear, routesOrder[i], app );
    logger.info('router', i);
  }
  //console.log(app.express.routes);
}

/**
 * find given original controller path and
 * resolve setup route path
 *
 * @class Router
 * @method resolve
 * @param {String} controller
 * @param {String} action [optional] action to be appended to resolved route
 * @param {Boolean} silent [optional] do not throw an error (default: false)
 **/
router.resolve = function resolveRoute( controller, action, silent ){
  for( var i in routesOrder ){
    if( routesOrder[i] === controller ){
      //console.log( action ? path.join(i,action) :i );
      return ( action ? path.join(i,action) : i );
    }
  }
  if( arguments.length < 3 || !silent )
    throw 'cannot resolve controller ' + controller + ' action:' + (action || '');
  return null;
}

module.exports = router;