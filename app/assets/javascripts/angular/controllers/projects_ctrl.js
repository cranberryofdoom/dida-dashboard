Dida.controller('ProjectIndexController', function($scope, $http, $log, Project, Team) {
	
	$scope.projects = Project.query(function() {
		angular.forEach($scope.projects, function(value, key){
			$scope.projects[key].mediums_json = JSON.parse($scope.projects[key].mediums_json);
		});
	});

	$scope.teams = Team.query();

	var indexedProjects = [];
	$scope.updateTeam = function(team, project) {
		$http.post('projects/' + project.id + '/update_team', {'team_id': team.id})
		.success(function(){
			project.team = team;
		});
	};

	$scope.updateDesigner = function (designer, project) {
		$http.post('projects/' + project.id + '/update_designer', {'user_id': designer.id})
		.success(function(){
			project.status = "assigned";
			project.user = designer;
			alert("project assigned!");
		});
	};

	$scope.deleteProject = function (project) {
		$http.delete('projects/' + project.id)
		.success(function(){
		});
	};
	
});