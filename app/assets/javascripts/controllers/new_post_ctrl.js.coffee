#= require namespace

glo.angular.controller "NewPostCtrl",
  ['$scope',
  '$resource',
  'CategoryService',
  'KeywordService'
  ($s, $resource, CategoryService, KeywordService) ->
    self = @
    $s.search = ""
    $s.categories = []
    $s.activeCategories = []

    CategoryService.all (categories) ->
      $s.categories = $s.activeCategories = categories
      KeywordService.categorySearchHash (resp) ->
        $s.keywordsTrie = new TrieDictionary(resp.data)
        activateSearchBox()

    activateSearchBox = ->
      $s.$watch 'search', (newVal, oldVal) ->
        categoryIds = []
        searchTerms = _.reject newVal.split(/\s+/), (val) -> val.length < 2
        if searchTerms.length > 0
          _.each searchTerms, (term) ->
            categoryIds = categoryIds.concat _.flatten($s.keywordsTrie.findValues(term))
          categoryIds = _.uniq(categoryIds)

          $s.activeCategories = []
          _.each $s.categories, (category) ->
            if _.contains categoryIds, category.id
              $s.activeCategories.push(category)
        else
          $s.activeCategories = $s.categories

    categoryPick = (el) ->
      # PostService.putCategory(categoryId)
      # move to next step
      # KeywordService.learn(categoryId, searchString)
]
