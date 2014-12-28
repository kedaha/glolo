class Glo.Views.Base extends Backbone.View
  initialize: (options) ->
    super(options)
    @subviews = {}

  render: (locals) ->
    locals ||= {}
    locals = _.extend(@model.attributes, locals) if @model
    @$el.html(@template(locals))
    @
