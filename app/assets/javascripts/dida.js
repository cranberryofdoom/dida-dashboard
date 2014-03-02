window.Dida = angular.module('DiDA', ['restangular', 'ngResource', 'ngRoute', 'ngDragDrop']);

Dida.config(function ($routeProvider) {
	$routeProvider
	.when('/users/:id',
	{
		templateUrl: 'users/index.html.erb',
		controller: 'UsersController'
	})
	.when('/users',
	{
		templateUrl: 'users/index.html.erb',
		controller: 'UsersController'
	})
	.when('/teams', 
	{
		templateUrl: 'teams/index.html.erb',
		controller: 'teams_ctrl',
	})
	.when('/projects',
	{
		templateUrl: 'projects/index.html.erb',
		controller: 'projects_ctrl'
	})
	.otherwise({redirectTo: '/projects'});
});