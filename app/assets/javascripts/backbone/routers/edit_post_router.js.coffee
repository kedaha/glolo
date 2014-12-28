class Glo.Routers.EditPostRouter extends Backbone.Router
  initialize: (options) ->
    @post = new Glo.Models.Post(options.post)

  routes:
    "edit_category"   : "editCategory"
    "edit_details"    : "editDetails"
    ""                : "edit"

  editCategory: ->
    @navigateToState(@post.defaultState()) if !@post.validAtState('category')
    @view = new Glo.Views.Posts.Edit(el: $("#post"), model: @post)
    @view.navigatedState = "category"
    @view.render()

  editDetails: ->
    @navigateToState(@post.defaultState()) if !@post.validAtState('details')
    @view = new Glo.Views.Posts.Edit(el: $("#post"), model: @post)
    @view.navigatedState = "details"
    @view.render()

  edit: -> @navigateToState(@post.defaultState())

  navigateToState: (state) ->
    route = {
      'category': 'edit_category'
      'details' : 'edit_details'
    }[state]

    @navigate(route, {trigger: true})
