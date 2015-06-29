	/**
	 * APP
	 * */

	var app = angular.module('travel', 
		['controllers-ctrl']);	

	var nameVarInject = '$scope';

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