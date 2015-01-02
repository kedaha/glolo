#= require backbone/views/base
#= require backbone/views/items/namespace

class Glo.Views.Items.EditCategories extends Glo.Views.Base
  template: JST["backbone/templates/items/edit_categories"]

  initialize: (options) ->
    super(options)
    @item = options.item
    @subviewsArray = []
    @categories = new Glo.Collections.ItemCategories()
    @categories.fetch
      success: =>
        @render()

    @render()

  render: ->
    super(item: @item.attributes)
    _.each @subviewsArray, (view) => view.remove()
    @subviewsArray.length = 0

    _.each @categories.models, (category) =>
      view = new Glo.Views.Items.EditCategory(model: category, item: @item)
      @subviewsArray.push view
      @$("#item-category-choices").append(view.render().$el)
