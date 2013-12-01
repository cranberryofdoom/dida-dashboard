Dida.factory('Team', ['$resource', function($resource) {
	return $resource('/api/teams/:id',
		{id: '@id'});
}]);

Dida.factory('Designer', ['$resource', function($resource) {
	return $resource('/api/users/:id',
		{id: '@id'});
}]);