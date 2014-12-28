#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.Edit extends Glo.Views.Base
  template : JST["backbone/templates/posts/edit"]

  initialize: (options) ->
    super(options)
    Backbone.Subviews.add(@);
    @listenTo(@model, "postUpdatedState", @nextViewState.bind(@))

  subviewCreators:
    categoryView: ->
      if @activeState() == 'category'
        new Glo.Views.Posts.EditCategories(model: @model)

    postableView: ->
      if @activeState() == 'details'
        switch @model.get('postable_type')
          when "PostItemSale"
            model = new Glo.Models.PostItemSale(@model.get('postable'))
            new Glo.Views.PostItemSales.Edit(model: model)
          when "PostJob"
            console.log("BRANCH NOT BUILT YET")
            # model = new Glo.Models.PostJob(@model.get('postable'))
            # new Glo.Views.PostJobs.Edit(model: model)

  activeState: -> @navigatedState || @model.defaultState()

  nextViewState: ->
    Glo.router.navigateToState(@model.defaultState())

