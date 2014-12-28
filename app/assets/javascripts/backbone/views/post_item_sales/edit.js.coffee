#= require backbone/views/base
#= require backbone/views/post_item_sales/namespace

class Glo.Views.PostItemSales.Edit extends Glo.Views.Base
  template: JST["backbone/templates/post_item_sales/edit"]

  initialize: (options) ->
    super(options)
    Backbone.Subviews.add(@);

  subviewCreators:
    item: ->
      debugger
      model = new Glo.Models.Item holder_id: @model.id, holder_type: @model.type
      new Glo.Views.Items.Edit(model: model)
