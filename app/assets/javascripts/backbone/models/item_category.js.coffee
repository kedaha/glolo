class Glo.Models.ItemCategory extends Backbone.Model
  paramRoot: 'item_category'
  urlRoot: '/item_categories'

  defaults:
    presentation: null

class Glo.Collections.ItemCategories extends Backbone.Collection
  model: Glo.Models.ItemCategory
  url: '/item_categories'
