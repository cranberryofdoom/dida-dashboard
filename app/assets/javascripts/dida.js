window.Dida = angular.module('DiDA', ['ngResource', 'ngRoute']);

Dida.config(function ($routeProvider) {
	$routeProvider
	.when('/teams', 
	{
		templateUrl: 'teams/index.html.erb',
		controller: 'teams_ctrl'
	})
});