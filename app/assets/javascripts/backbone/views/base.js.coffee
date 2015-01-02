class Glo.Views.Base extends Backbone.View
  initialize: (options) ->
    super(options)
    @subviews = {}

  render: (locals) ->
    locals ||= {}
    locals.model = @model.toJSON() if @model
    locals.collection = @collection.toJSON() if @collection
    @$el.html(@template(locals))
    @
