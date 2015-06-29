	/**
	 * APP
	 * */

	var app = angular.module('sysweb', 
		['controllers-ctrl']);	

	var nameVarInject = '$scope';
	
	/**
	 * Controllers
	 * */
	
	var controllers = angular.module('controllers-ctrl',[]);


/** rotas
sampleApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/uri-callback', {
	templateUrl: 'templates/add_order.html',
	controller: 'controller1'
      }).
      when('/uri-calback2', {
	templateUrl: 'templates/show_orders.html',
	controller: 'controller2'
      }).
      otherwise({
	redirectTo: '/AddNewOrder'
      });
}]);
**/