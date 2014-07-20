$ ->
  if $("#new-post-categories").length > 0
    new CategoryPickerView($("#category-search-input"), $("#new-post-categories"))

