#= require namespace
#= require models/post

glo.angular.factory 'PostService', ['$http', 'Post', ($http, Post) ->
  {
    putCategory: (id, successFunc, errorFunc, loadingFunc) ->
      $http.put("/posts/#{id}/category.json").then successFunc
  }
]
