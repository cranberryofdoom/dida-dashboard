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
    $scope.remove_designer = function(userId, team) {
        console.log(userId);
        console.log(team.id);

        $http.delete('teams/' + team.id + '/remove_designer')
        .success(function(){

          //   for(i in team.users){
          //       if(team.users[i].id ==  userId) {
          //           team.users -= teams.users[i];
          //           console.log(team.users);
          //       }
          //       else {
          //         console.log('already added');
          //     }
          // }
      });

    };

    $scope.startCallback = function(event, ui, user) {
        console.log('Dropped into something' + user.id);
        $scope.draggedDesigner = user;
    };

    $scope.dropCallback = function(event, ui, team) {
        console.log($scope.draggedDesigner.id + ', ' + team.id);
        // var alreadyAdded = false;
        // for(i in team.users) {
        //     if(team.users[i].id == $scope.draggedDesigner.id) {
        //         alreadyAdded = true;
        //         console.log(alreadyAdded);
        //     }
        // };
        // if (alreadyAdded == false) {
        //                     console.log(alreadyAdded);

            $http.post('teams/' + team.id + '/add_designer', {'user_id': $scope.draggedDesigner.id})
            .success(function(){
                team.users += $scope.draggedDesigner;
          //           console.log(team.users);
          //       }
          //       else {
          //         console.log('already agdded');
      });
        // };
        
    };

});