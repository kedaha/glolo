#= require namespace
#= require models/post

glo.angular.factory 'PostService', ['$http', 'Post', ($http, Post) ->
  {
    current: ->
      $http(
        method: "GET"
        url: '/posts/current'
      ).
      success( (data) ->
        Post.current.updateAttributes(data)
      )
  }
]
