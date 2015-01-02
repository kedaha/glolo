#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.NewCategories extends Glo.Views.Base
  template : JST["backbone/templates/posts/new_categories"]

  initialize: (options) ->
    super(options)
    @subviewsArray = []
    @types = new Glo.Collections.PostTypes()
    @types.fetch
      success: => @render()

    @render()

  render: ->
    super()
    _.each @subviewsArray, (view) => view.remove()
    @subviewsArray.length = 0

    _.each @types.models, (category) =>
      view = new Glo.Views.Posts.NewCategory(model: category)
      @subviewsArray.push view
      @$("#post-category-choices").append(view.render().$el)
      @listenTo(category, 'postCategoryChosen', @updatePost.bind(@))

  updatePost: (postType) ->
    @model.set('type', postType)
    @model.save null,
      success: (model) =>
        @model.trigger('postUpdatedState')
