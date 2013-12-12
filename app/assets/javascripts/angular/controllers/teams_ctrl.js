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

	$scope.deleteDesigner = function(designerIndex, designer) {
		$http.post('teams/delete_designer', {'user_id': designer.id})
		.success(function(){
			$scope.designers.splice(designerIndex, 1);
		});
	}

	$scope.startCallback = function(event, ui, user) {
		$scope.draggedDesigner = user;
	};

	$scope.dropCallback = function(event, ui, team) {
			$http.post('teams/' + team.id + '/add_designer', {'user_id': $scope.draggedDesigner.id})
			.success(function(){
				team.users.concat($scope.draggedDesigner.id);
			});
	};

	$scope.edit = true;

	$scope.editDesigners = function() {
		$scope.edit = $scope.edit === false ? true: false;
		if ($scope.edit == false) {
			$('#team-list').hide();
			$('#designer-roster').removeClass('col-sm-2').addClass('col-sm-10');
		}
		else {
			$('#team-list').show();
			$('#designer-roster').addClass('col-sm-2').removeClass('col-sm-10');
		}
	}
});