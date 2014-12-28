#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.EditCategories extends Glo.Views.Base
  template : JST["backbone/templates/posts/edit_categories"]

  initialize: (options) ->
    super(options)
    @subviewsArray = []
    @categories = new Glo.Collections.PostCategories()
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
