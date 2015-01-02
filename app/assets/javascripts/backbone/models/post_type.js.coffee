class Glo.Models.PostType extends Backbone.Model
  paramRoot: 'post_type'
  urlRoot: '/post_types'

  defaults:
    presentation: null

class Glo.Collections.PostTypes extends Backbone.Collection
  model: Glo.Models.PostType
  url: '/post_types'
