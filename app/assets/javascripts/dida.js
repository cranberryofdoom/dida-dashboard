window.Dida = angular.module('DiDA', ['ngResource', 'ngRoute', 'ngDragDrop']);

Dida.config(function ($routeProvider) {
	$routeProvider
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
});