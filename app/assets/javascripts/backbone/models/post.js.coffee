#= require backbone/models/base

class Glo.Models.Post extends Glo.Models.Base
  paramRoot: 'post'
  urlRoot: '/posts'

  defaults:
    title: null
    contact_profile_id: null

  relations: [
    {
      type: Backbone.One
      key: "postable"
      relatedModel: Glo.Models.Base.findPolymorphicType
    }
  ]

  defaultState: ->
    if !@get('category_id')
      "category"
    else
      "details"

  validAtState: (state) ->
    switch @defaultState()
      when "category" then _.include(["category"], state)
      when "details" then _.include(["details"], state)

class Glo.Collections.Posts extends Backbone.Collection
  model: Glo.Models.Post
  url: '/posts'
