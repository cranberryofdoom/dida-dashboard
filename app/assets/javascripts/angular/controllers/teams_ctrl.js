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
	};

    $scope.startCallback = function(event, ui, user) {
        console.log('Dropped into something' + user.id);
        $scope.draggedDesigner = user;
    };


    $scope.dropCallback = function(event, ui, team) {
        console.log('Dropped into something');
        console.log($scope.draggedDesigner);
        console.log(team.id);

        $http.post('teams/' + team.id + '/add_designer', {'user_id': $scope.draggedDesigner.id})
        .success(function(){
            for(i in team.users){
                if(team.users[i].id !=  $scope.draggedDesigner.id) {
                    team.users += $scope.draggedDesigner;
                  console.log(team.users);
                    
                }
                else {
                  console.log('already agdded');
              }
          }
          
      });
    };

});