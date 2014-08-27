#= require namespace
#= require models/keyword

glo.angular.factory 'KeywordService', ['$http', 'Keyword', ($http, Keyword) ->
  {
    categorySearchHash: (successFunction, errorFunction, loadingFunction) ->
      $http.get('/keywords/category_search_hash.json').then successFunction
  }
]
