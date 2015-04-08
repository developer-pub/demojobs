ap = angular.module('app', [])

ap.controller('SearchDynamicController', ['$scope', '$http', function($scope, $http){
	$scope.searchText = '';
	$scope.pageNumber = 1;

	function generateLink(pageNumber) {
		return {type: "link", pageNumber: i, name: i.toString()};
	}

	function generateLinks(from, to) {
		links = [];

		for(i = from; i <= to; i++)
			links.push(generateLink(i));

		return links;
	}

	function generateDynamicLinksSide(from, to, cutoff, leftCount, rightCount) {
		if(to - from < cutoff)
			return generateLinks(from, to)
		else
			return generateLinks(from, from + leftCount)
					.concat({type: "spacer"})
					.concat(generateLinks(to - rightCount, to));
	}

	function setPagingModel(results) {
		cutoff = 7
		outerSide = 2
		innerSide = 1

		pagingLinks = [];

		pagingLinks = pagingLinks.concat(generateDynamicLinksSide(1, results.pageNumber - 1, cutoff, outerSide, innerSide));
		pagingLinks.push(generateLink(results.pageNumber));
		pagingLinks = pagingLinks.concat(generateDynamicLinksSide(results.pageNumber + 1, results.pageCount, cutoff, innerSide, outerSide));

		$scope.pagingLinks = pagingLinks;
	}

	function updateResults(results) {
		console.log(results);
		$scope.results = results;
		$scope.pageNumber = results.pageNumber;
		setPagingModel(results);
	}

	$scope.loadPage = function(pageNumber) {
		$http.get('/search.json?body=' + encodeURIComponent($scope.searchText) + "&page_number=" + pageNumber).success(function(results) {
			updateResults(results);
		});
	}

	$scope.$watch('searchText', function(newValue, oldValue) {
		$scope.loadPage(1);
	});
}]);
