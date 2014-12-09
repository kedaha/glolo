#= require namespace
#= require models/namespace

class glo.Models.Base
  @buildCollection: (data) ->
    self = @
    data.map (attrs) -> new self(attrs)

  constructor: (attrs) ->
    for attribute, value of attrs
      @[attribute] = value

  updateAttributes: (attrs) ->
    for attribute, value of attrs
      @[attribute] = value

