#= require backbone/models/base
#= require backbone/models/post/namespace

class Glo.Models.Post.ItemSale extends Glo.Models.Post.Generic
  relations: [
    {
      type: Backbone.One
      key: 'item'
      relatedModel: 'Glo.Models.Item'
    }
  ]

class Glo.Collections.Post.ItemSales extends Glo.Collections.Post.Generics
  model: Glo.Models.Post.ItemSales
