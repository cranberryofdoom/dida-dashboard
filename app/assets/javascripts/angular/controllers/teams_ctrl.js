Dida.controller('TeamIndexController', function($scope, Team, Designer) {
    //Grab all forums from the server
    $scope.teams = Team.query();
    console.log($scope.teams.name);
    $scope.team = Team.get({id: $routeParams.id});

    $scope.designer = Designer.query({teamId: "3"});
});

//A controller to show the team and all it's glory
Dida.controller('TeamShowController', function($scope, Team, Designer, $routeParams) {
    //Grab the team from the server
    $scope.team = Team.get({id: $routeParams.id});
    
});

Dida.controller('DesignerController', function($scope, Team, Designer, $routeParams) {
    //Grab all the comments from the server
    $scope.designer = Designer.query({teamId: "3"});
});