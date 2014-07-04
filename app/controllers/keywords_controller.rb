class KeywordsController < ApplicationController
  respond_to :json

  def find_categories
    categories = KeywordService.find_categories(params[:keywords])
    respond_with categories, root: :categories
  end

  def category_search_hash
    respond_with KeywordService.all_keywords_with_categories
  end
end
