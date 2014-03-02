Dida.controller('UsersController', function($scope, $http, $log, Designer, Team) {
	$scope.teams = Team.query();
	$scope.designers = Designer.query();

// console.log($scope.designers);


$scope.deleteDesigner = function(designerIndex, designer) {
	$http.post('teams/delete_designer', {'user_id': designer.id})
	.success(function(){
		$scope.designers.splice(designerIndex, 1);
	});
}

$scope.designersEdit = true;

$scope.updateDesigner = function(designer) {
	var cur_designer = Designer.get({id: designer.id}, function() {
		cur_designer.netid = designer.editnetid;
		cur_designer.email = designer.editemail;

		$id = designer.id;
		Designer.update({id: $id}, cur_designer);

		// cur_designer.$save();
	})
	console.log(cur_designer);
}

});