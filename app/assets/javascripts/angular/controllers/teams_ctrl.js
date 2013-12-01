Dida.controller('TeamIndexController', function($scope, Team) {
    //Grab all forums from the server
    $scope.teams = Team.query();
});