class Glo.Models.PostItemSale extends Backbone.Model
  paramRoot: 'post_item_sale'
  urlRoot: '/post_item_sales'

  defaults:
    items: []

  defaultState: ->
    if !@get('category_id')
      "category"
    else
      "details"
