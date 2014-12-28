#= require backbone/views/base
#= require backbone/views/items/namespace

class Glo.Views.Items.EditCategories extends Glo.Views.Base
  template: JST["backbone/templates/items/edit_categories"]

  initialize: (options) ->
    super(options)
    @subviewsArray = []
    @categories = new Glo.Collections.ItemCategories()
    @categories.fetch
      success: => @render()

    @render()

  render: ->
    super()
    _.each @subviewsArray, (view) => view.remove()
    @subviewsArray.length = 0

    _.each @categories.models, (category) =>
      view = new Glo.Views.Posts.EditCategory(model: category)
      @subviewsArray.push view
      @$("#post-category-choices").append(view.render().$el)
      @listenTo(category, 'postCategoryUpdated', @updatePost.bind(@))

  updatePost: (categoryId) ->
    @model.set('category_id', categoryId)
    @model.save null,
      success: (model) => @model.trigger('postUpdatedState')
