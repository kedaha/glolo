class Glo.Models.Item extends Glo.Models.Base
  paramRoot: 'item'
  urlRoot: '/items'

  relations: [
    {
      type: Backbone.Many
      key: "categories"
      collectionType: "Glo.Collections.ItemCategories"
    }
  ]

  defaults:
    id: null
    user_id: null
    holder_id: null
    holder_type: null
    title: null
    description: null
    length: null
    width: null
    height: null
    link: null
    pet_free: null
    why_selling: null
    any_defects: null
    condition_id: null
    categories: []

class Glo.Collections.Items extends Backbone.Collection
  model: Glo.Models.Item
  url: '/items'
