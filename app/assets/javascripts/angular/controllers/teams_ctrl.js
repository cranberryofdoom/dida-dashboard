Dida.controller('TeamIndexController', function($scope, $http, Team, Designer, $timeout) {
	$scope.teams = Team.query();
	$scope.designers = Designer.query();
	$scope.delete = function(id) {
		for(i in $scope.teams) {
			if($scope.teams[i].id == id) {
				$http.delete('teams/' + id)
				.success(function(){
					$scope.teams.splice(i,1);
				});
			}
		}
	}
});