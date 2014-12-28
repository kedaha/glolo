class Glo.Models.Base extends Backbone.AssociatedModel
  @findPolymorphicType: (relation, attributes) ->
    Glo.Models[attributes["#{relation.key}_type"]]

