#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.New extends Glo.Views.Base
  template : JST["backbone/templates/posts/new"]

  initialize: (options) ->
    super(options)
    Backbone.Subviews.add(@);
    @listenTo(@model, "postUpdatedState", @nextViewState.bind(@))

  subviewCreators:
    categoryView: -> new Glo.Views.Posts.NewCategories(model: @model)

  nextViewState: ->
    Glo.router.navigateToState(@model.defaultState())

