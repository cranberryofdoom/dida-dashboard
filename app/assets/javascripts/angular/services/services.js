Dida.factory('Team', ['$resource', function($resource) {
	return $resource('/teams/:id.json', {}, {
		query: {method:'GET', params:{id:'id'}, isArray:true},
		post: {method:'POST'},
		update: {method:'PUT', params: {id: '@id'}},
		remove: {method:'DELETE'}
	});
}]);

Dida.factory('Designer', ['$resource', function($resource) {
	return $resource('/users/:id.json',
		{id: '@id'});
}]);

Dida.factory('Project', ['$resource', function($resource) {
	return $resource('projects/:id.json',
		{id: '@id'});
}]);

Dida.factory('Team', ['$resource', function($resource) {
	return $resource('/teams/:id.json',
		{id: '@id'});
}]);
