#= require jquery
#= require namespace

glo.angular.controller "EditPostCtrl",
  ['$scope', 'Post', 'PostService', 'PageData',
  ($s, Post, PostService, PageData) ->
    $s.post = Post.current = new Post(PageData.data.post)
]
