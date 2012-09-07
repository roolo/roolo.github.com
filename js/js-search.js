angular.module('rooland', []);



function ArticlesCtrl($scope, $http) {
  $scope.articlesData = {};

  $scope.initSearchData = function() {
    $scope.loadingData = true;
    $http.get('/articles.json')
      .success(function (response){
        $scope.articlesData.data = response.data;
      })
    ;
  };

  $scope.searchForTerm = function() {
    var searchPattern = new RegExp($scope.searchTerm);

    if(angular.isDefined($scope.articlesData.data)) {
      $scope.foundArticles = jQuery.grep($scope.articlesData.data,function(a){
        return searchPattern.test(a.title);
      })
        .map(function(a){return a.identifier;});
    } else {
      $scope.initSearchData();
    }

  };

  $scope.hasNotFound = function(articleIdentifier) {
    if(angular.isDefined($scope.searchTerm) && $scope.searchTerm !== '' && angular.isDefined($scope.articlesData.data)){
      return jQuery.inArray(articleIdentifier, $scope.foundArticles);
    } else {
      return false;
    }
  };
}

ArticlesCtrl.$inject = ['$scope', '$http'];
