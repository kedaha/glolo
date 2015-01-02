#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.NewCategory extends Glo.Views.Base
  template: _.template(
    '<button class="button button-pick-list js-post-update-category"><%= model.presentation %></button>'
  )
  className: "pick-list--item"

  events:
    "click .js-post-update-category" : "updatePost"

  updatePost: ->
    @model.trigger('postCategoryChosen', @model.get('type'))
