class Glo.Routers.EditPostRouter extends Backbone.Router
  initialize: (options) ->
    @post = new Glo.Models.Post(options.post)

  routes:
    "pick_category"   : "pickCategory"

  pickCategory: ->
    @view = new Glo.Views.Posts.PickCategory(el: $("#post-category"), model: @post)
