#= require backbone/models/base
#= require backbone/models/post/namespace

class Glo.Models.Post.Generic extends Glo.Models.Base
  paramRoot: 'post'
  urlRoot: '/posts'

  defaultState: ->
    if !@get('type')
      "category"
    else
      @get('type')

class Glo.Collections.Post.Generics extends Backbone.Collection
  model: Glo.Models.Post.Generics
  url: '/posts'
