Dida.controller('ProjectShowController', function($scope, $http, $log, $filter, $routeParams, Project, Team) {


	$scope.projects = Project.query();

	$scope.teams = Team.query();



	$scope.team = Team.query();

	$scope.updateTeam = function(team, project) {
		$http.post(project + '/update_team', {'team_id': team.id})
		.success(function(){
			$scope.team = team;
		});
	};

	$scope.updateDesigner = function(designer, project) {
		$http.post(project + '/update_designer', {'user_id': designer.id})
		.success(function(){
			project.status = "assigned";
			project.user = designer;
			alert("project assigned!");
		});
	};
	
});