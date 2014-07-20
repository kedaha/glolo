class Glo.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    type: null
    contact_profile_id: null

  defaultStep: ->
    if true # !@get('type')
      "pick_category"

class Glo.Collections.PostsCollection extends Backbone.Collection
  model: Glo.Models.Post
  url: '/posts'
