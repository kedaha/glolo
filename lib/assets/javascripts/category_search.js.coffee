class @CategorySearch
  constructor: ($searchElement, $containerEl) ->
    self = @
    @$searchElement = $searchElement
    @$containerEl = $containerEl
    @$categoryElements = null
    @activeCategoryIds = []
    @keywordsTrie = null

    @hidingSelector = 'deprioritized'

    @getCategories  (data) ->
      self.activeCategoryIds = _.pluck(data.categories, 'id')
      self.fillCategoryView(data)
      self.listenForCategoryChoice()
      self.activateSearchElement()
      self.retrieveKeywordsHash()

    CategorySearch.addInstance(@)

  $templateEl: ->
    @_$templateEl ||= $(
      "<div class='flex-item category-wrapper' data-category-id>" +
        "<div class='category-content' data-category-content></div>" +
      "</div>"
    )

  searchVal: ->
    @$searchElement.val().trim()

  getCategories: (callback) ->
    $.ajax
      type: "GET"
      url: "/categories"
      success: callback

  fillCategoryView: (data) ->
    self = @
    _.each data.categories, (category) ->
      $categoryEl = self.$templateEl().clone().data("category-id", category.id)
      $categoryEl.find('[data-category-content]').text(category.name)
      self.$containerEl.append($categoryEl)

    @$categoryElements = self.$containerEl.find('[data-category-id]')

  listenForCategoryChoice: ->
    self = @

    @$categoryElements.on 'click', (event) ->
      $el = $(event.target)
      categoryId = $el.data("category-id")
      self.chooseCategory(categoryId)
      self.learnKeywords(categoryId)

  chooseCategory: (categoryId) ->
    # remove cateogory from picking view, put it in some chosen view
    # same with data

  learnKeywords: (categoryId) ->
    $.ajax
      type: "POST"
      url: "categories/#{categoryId}/learn_keywords"
      data: { "keyword_string": @searchVal() }


  retrieveKeywordsHash: (callback) ->
    self = @

    $.ajax
      type: "GET"
      url: "/keywords/category_search_hash"
      success: (data) ->
        self.keywordsTrie = new TrieDictionary(data)

  activateSearchElement: ->
    self = @
    @$searchElement.on 'keyup', (evt) ->
      self.updateActiveCategories ->
        self.updateView()

  updateActiveCategories: (callback) ->
    self = @
    if @keywordsTrie # has been loaded
      searchCategoryIds = []
      searchTerms = @searchVal().split(/\s+/)
      _.each searchTerms, (term) ->
        searchCategoryIds = searchCategoryIds.concat _.flatten(self.keywordsTrie.findValues(term))

      activeCategoryIds = _.uniq(searchCategoryIds)
      @activeCategoryIds = activeCategoryIds if activeCategoryIds.length > 0
      callback()
    else
      $.ajax
        type: "GET"
        url: "/keywords/find_categories?keywords=#{@searchVal()}"
        success: (data) ->
          self.activeCategoryIds = _.pluck(data.categories, 'id') if data.categories.length > 0
          callback()

  updateView: ->
    self = this
    @$categoryElements.each ->
      $el = $(@)

      if _.contains self.activeCategoryIds, $el.data("category-id")
        self.showCategory($el)
      else
        self.hideCategory($el)

  showCategory: ($el) ->
    $el.removeClass(@hidingSelector)

  hideCategory: ($el) ->
    $el.addClass(@hidingSelector)

CategorySearch.addInstance = (obj) ->
  @instances ||= []
  @instances.push(obj)

CategorySearch.instance = ->
  CategorySearch.instances[0]
