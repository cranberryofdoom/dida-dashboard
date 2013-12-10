Dida.factory('Team', ['$resource', function($resource) {
	return $resource('/api/teams/:id', {}, {
		query: {method:'GET', params:{id:'id'}, isArray:true},
		post: {method:'POST'},
		update: {method:'PUT', params: {id: '@id'}},
		remove: {method:'DELETE'}
	});
}]);

Dida.factory('Designer', ['$resource', function($resource) {
	return $resource('/api/users/:id',
		{id: '@id'});
}]);

Dida.factory('Project', ['$resource', function($resource) {
	return $resource('/api/projects/:id',
		{id: '@id'});
}]);
