_.extend Glo.Helpers,
  camelCase: (input) ->
    input.toLowerCase().replace(/_(.)/g, (match, group1) ->
      group1.toUpperCase()
    ).capitalize()

String.prototype.capitalize = ->
  @charAt(0).toUpperCase() + @slice(1)
