Dida.controller('ProjectIndexController', function($scope, $http, Project, Team) {
	$scope.projects = Project.query();
	$scope.teams = Team.query();
	var indexedProjects = [];
	$scope.updateTeam = function(team, project) {
		$http.post('projects/' + project.id + '/update_team', {'team_id': team.id})
		.success(function(){
			project.team = team;
		});
	}
	$scope.updateDesigner = function (designer, project) {

		$http.post('projects/' + project.id + '/update_designer', {'user_id': designer.id})
		.success(function(){
			project.status = "assigned";
			project.user = designer;
			alert("project assigned!");
		});
	}
});