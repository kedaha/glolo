#= require backbone/views/items/namespace
#= require backbone/views/base

class Glo.Views.Items.EditCategory extends Glo.Views.Base
  template: _.template(
    '<button class="button button-pick-list js-item-update-category <%= buttonDisabled ? "button-hidden" : "" %>"><%= model.presentation %></button>'
  )
  className: "pick-list--item"

  events:
    "click .js-item-update-category" : "notifyItemOfNewCategory"

  initialize: (options) ->
    super(options)
    @item = options.item

  render: ->
    inItemCategories = _.include(
      _.map(@item.get('categories'), (c) -> c.get('name')), @model.get('name')
    )
    super(buttonDisabled: inItemCategories)

  notifyItemOfNewCategory: ->
    @item.trigger('itemCategoryChosen', @model)
