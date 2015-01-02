class Glo.Routers.EditPostRouter extends Backbone.Router
  initialize: (options) ->
    @post = Glo.Models.Post.Factory(options.post)

  routes:
    "new"             : "new"
    "edit_item_sale"  : "editItemSale"
    ""                : "edit"

  new: ->
    @redirectIfNotAllowed(@post.defaultState())
    @view = new Glo.Views.Posts.New(el: $("#post"), model: @post)
    @view.render()

  editItemSale: ->
    @redirectIfNotAllowed(@post.defaultState())
    @view = new Glo.Views.Posts.EditItemSale(el: $("#post"), model: @post)
    @view.render()

  edit: -> @navigateToState(@post.defaultState())

  routeForModelState: (modelState) ->
    {
      'category'        : 'new'
      'post_item_sale'  : 'edit_item_sale'
    }[modelState]

  navigateToState: (state) ->
    @navigate(@routeForModelState(state), {trigger: true})

  redirectIfNotAllowed: (modelState) ->
    if @routeForModelState(modelState) != Backbone.history.fragment
      @navigateToState(modelState)
