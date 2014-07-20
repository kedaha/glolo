#= require_relative ./namespace
#= require backbone/views/base_view

class Glo.Views.Posts.PickCategory extends Glo.BaseView
  template : JST["backbone/templates/posts/pick_category"]

  events :
    "submit #post-update-category" : "update"

  initialize: (options) ->
    super(options)
    @categories = new Glo.Collections.PostCategories()
    @categories.fetch({ success: @render.bind(@) })

    @render()

  render: ->
    @$el.html(@template(categories: @categories.toJSON()))

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (post) =>
        @model = post
        window.location.hash = "/#{@model.id}"
    )
