#= require namespace
#= require models/category

glo.angular.factory 'CategoryService', ['$resource', 'Category', ($resource, Category) ->
  resource = $resource '/categories.json'

  {
    all: (successFunction, errorFunction, loadingFunction) ->
      resource.get().$promise.then (data) ->
        successFunction Category.buildCollection(data.categories)
  }
]
