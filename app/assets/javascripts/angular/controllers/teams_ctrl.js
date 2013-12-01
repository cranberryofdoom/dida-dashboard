Dida.controller('TeamIndexController', function($scope, Team) {
    //Grab all forums from the server
    $scope.teams = Team.query();
});

Dida.controller('DesignerIndexController', function($scope, Designer) {
    //Grab all forums from the server
    $scope.designers = Designer.query();
});