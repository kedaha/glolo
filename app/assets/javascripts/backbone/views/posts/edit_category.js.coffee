#= require backbone/views/posts/namespace
#= require backbone/views/base

class Glo.Views.Posts.EditCategory extends Glo.Views.Base
  template: JST["backbone/templates/posts/edit_category"]
  className: "pick-list--item"

  events:
    "click .js-post-update-category" : "updatePost"

  updatePost: ->
    @model.trigger('postCategoryUpdated', @model.id)
