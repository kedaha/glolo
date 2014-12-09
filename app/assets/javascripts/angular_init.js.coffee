#= require angular/angular
#= require angular/angular-animate
#= require angular/angular-touch
#= require angular/angular-resource
#= require restangular
#= require namespace

glo.angular = angular.module("glo", ['ngResource', 'restangular']);

glo.angular.config(['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content')
])

glo.Util =
  snakeToCamel: (s) ->
    s.replace(/(\_\w)/g, ((m) -> m[1].toUpperCase()))
