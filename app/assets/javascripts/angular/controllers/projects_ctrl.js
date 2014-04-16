Dida.controller('ProjectIndexController', function($scope, $http, $log, $filter, Project, Team) {
	
	$scope.projects = Project.query(function() {
		angular.forEach($scope.projects, function(value, key){
			$scope.projects[key].mediums_json = JSON.parse($scope.projects[key].mediums_json);
			$scope.projects[key].due_date = $filter('date')($scope.projects[key].due_date, 'longDate');
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

	$scope.updateDesigner = function(designer, project) {
		$http.post('projects/' + project.id + '/update_designer', {'user_id': designer.id})
		.success(function(){
			project.status = "assigned";
			project.user = designer;
			alert("project assigned!");
		});
	};

	$scope.delete = function(projectIndex, projectId) {
		$http.delete('projects/' + projectId)
		.success(function(){
			$scope.projects.splice(projectIndex, 1);
		});
	};
	
});