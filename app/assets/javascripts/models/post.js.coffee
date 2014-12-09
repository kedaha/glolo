#= require namespace
#= require models/namespace
#= require models/base

glo.angular.factory 'Post', ->
  class glo.Models.Post extends glo.Models.Base
    @current: null

    categories: []
