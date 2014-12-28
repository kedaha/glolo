#= require backbone/views/base
#= require backbone/views/items/namespace

class Glo.Views.Items.Edit extends Glo.Views.Base
  template: JST["backbone/templates/items/edit"]

  subviewCreators:
    itemCategories: ->
      debugger
      if @model.categories.length == 0
        new Glo.Views.Items.EditCategories(@model.items[0])
