Dida.factory('Team', ['$resource', function($resource) {
	return $resource('/api/teams/:id',
		{id: '@id'});
}]);

Dida.factory('Designer', function($resource) {
    return $resource('/api/teams/:teamId/users/:id',
    	{teamId: '@teamId', id: '@id'});
});
