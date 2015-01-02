#= require backbone/views/base
#= require backbone/views/items/namespace

class Glo.Views.Items.Edit extends Glo.Views.Base
  template: JST["backbone/templates/items/edit"]

  initialize: (options) ->
    super(options)
    @post = options.post
    Backbone.Subviews.add(@);
    @listenTo @model, 'itemCategoryChosen', (category) =>
    # if item has 3 categories, automatically switch to next step
      debugger
      @model.get('categories').add(category)
      @post.save null, success: (model) =>
        debugger
        @render()

  subviewCreators:
    itemCategories: ->
      if @model.get('categories').length < 3
        new Glo.Views.Items.EditCategories(item: @model)


