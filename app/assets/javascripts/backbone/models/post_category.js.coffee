class Glo.Models.PostCategory extends Backbone.Model
  paramRoot: 'post_category'
  urlRoot: '/post_categories'

  defaults:
    presentation: null

class Glo.Collections.PostCategories extends Backbone.Collection
  model: Glo.Models.PostCategory
  url: '/post_categories'
