Dida.controller('TeamIndexController', function($scope, Team, Designer) {
    $scope.teams = Team.query();
    $scope.designers = Designer.query();
});
