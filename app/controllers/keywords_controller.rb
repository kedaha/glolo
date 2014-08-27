class KeywordsController < ApplicationController
  respond_to :json

  def category_search_hash
    respond_with KeywordService.all_keywords_with_categories
  end
end
