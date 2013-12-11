Dida.controller('TeamIndexController', function($scope, $http, Team, Designer, $timeout, $parse) {
	$scope.teams = Team.query();
	$scope.designers = Designer.query();
	$scope.delete = function(teamIndex, teamId) {
		$http.delete('teams/' + teamId)
		.success(function(){
			$scope.teams.splice(teamIndex, 1);
		});
	};
	$scope.removeDesigner = function(designerIndex, designer, team) {
		$http.post('teams/' + team.id + '/remove_designer', {'user_id': designer.id})
		.success(function(){
			team.users.splice(designerIndex, 1);
		});
	};

	$scope.startCallback = function(event, ui, user) {
		$scope.draggedDesigner = user;
	};

	$scope.dropCallback = function(event, ui, team) {
        $http.post('teams/' + team.id + '/add_designer', {'user_id': $scope.draggedDesigner.id})
        .success(function(){
        	team.users.concat($scope.draggedDesigner.id);
        	alert("YAY");
        });
    };
});