#= require namespace
#= require models/namespace
#= require models/base

glo.angular.factory 'Category', ->
  class glo.Models.Category extends glo.Models.Base
    titleizedName: -> @name.toUpperCase()

    goofName: -> "goof#{@name}"
