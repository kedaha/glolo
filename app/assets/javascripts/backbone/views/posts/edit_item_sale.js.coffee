#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.EditItemSale extends Glo.Views.Base
  template : JST["backbone/templates/posts/edit_item_sale"]

  initialize: (options) ->
    super(options)
    Backbone.Subviews.add(@);

  subviewCreators:
    item: ->
      model = @model.get('item') || new Glo.Models.Item()
      # should instead just add item to post when it's finished, then immediately save
      @model.set('item', model)
      new Glo.Views.Items.Edit(model: model, post: @model)

  nextViewState: ->
    Glo.router.navigateToState(@model.defaultState())

