#= require backbone/models/base
#= require backbone/models/post/namespace

Glo.Models.Post.Factory = (attributes) ->
  if attributes.type
    modelName = Glo.Helpers.camelCase(attributes.type.replace("post_", ""))
    new Glo.Models.Post[modelName](attributes)
  else
    new Glo.Models.Post.Generic(attributes)
