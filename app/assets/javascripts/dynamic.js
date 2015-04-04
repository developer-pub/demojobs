ap = angular.module('app', [])

ap.controller('AlaController', function($scope, $http){
	$scope.searchText = '';

	$scope.$watch('searchText', function(newValue, oldValue){
		$http.get('/search.json?body=' + encodeURIComponent($scope.searchText)).success(function(results){
			$scope.results = results;
		});
	});
});
