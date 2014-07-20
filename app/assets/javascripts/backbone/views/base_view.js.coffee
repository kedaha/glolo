class Glo.BaseView extends Backbone.View
  assign: (view, selector) ->
    view.setElement(this.$(selector)).render()
