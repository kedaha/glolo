#= require namespace
#= require models/category

glo.angular.factory 'PageData', [ ->
  {
    data: $('#page-data').data('content')
  }
]
