#= require namespace

glo.angular.controller "EditPostCategoriesCtrl",
  ['$scope',
  '$resource',
  '$http',
  'CategoryService',
  'KeywordService',
  'Post',
  'Restangular'
  ($s, $resource, $http, CategoryService, KeywordService, Post, Restangular) ->
    self = @
    $s.post = Post.current
    $s.search = ""
    $s.allCategories = []
    $s.unpickedCategories = []
    $s.possibleNewCategories = []
    $s.chosenCategory = null
    $s.stepActive = true
    debugger # trying restangular
    $s.$watch 'chosenCategory', (newVal) ->
      saveCategory(newVal, $s.post) if newVal

    CategoryService.all (categories) ->
      $s.allCategories = categories
      $s.unpickedCategories =
      $s.possibleNewCategories = _.select categories, (category) -> !_.include(_.map($s.post.categories, ((c) -> c.id)), category.id)
      KeywordService.categorySearchHash (resp) ->
        $s.keywordsTrie = new TrieDictionary(resp.data)
        activateSearchBox()

    $s.addPostCategory = (category) ->
      $s.chosenCategory = category

    $s.removePostCategory = (category) ->
      $http(
        method: "DELETE"
        url: "/posts/#{$s.post.id}/categories/#{category.id}/remove.json"
      ).
      success( ->
        _.remove($s.post.categories, (c) -> c.id == category.id)
        $s.possibleNewCategories.push(category)
        $s.unpickedCategories.push(category)
      )

    activateSearchBox = ->
      $s.$watch 'search', (newVal, oldVal) ->
        categoryIds = []
        searchTerms = _.reject newVal.split(/\s+/), (val) -> val.length < 2
        if searchTerms.length > 0
          _.each searchTerms, (term) ->
            categoryIds = categoryIds.concat _.flatten($s.keywordsTrie.findValues(term))
          categoryIds = _.uniq(categoryIds)

          $s.possibleNewCategories = []
          _.each $s.allCategories, (category) ->
            if _.contains categoryIds, category.id
              $s.possibleNewCategories.push(category)
        else
          $s.possibleNewCategories = $s.unpickedCategories

    saveCategory = (category, post) ->
      $http(
        method: "POST"
        url: '/categories_posts.json'
        data: {category_id: category.id, post_id: post.id}
      ).
      success( ->
        $s.post.categories.push($s.chosenCategory)
        _.remove($s.possibleNewCategories, (c) -> c.id == $s.chosenCategory.id)
        _.remove($s.unpickedCategories, (c) -> c.id == $s.chosenCategory.id)
        $s.chosenCategory = null
      )
      # move to next step
      # KeywordService.learn(categoryId, searchString)
]
