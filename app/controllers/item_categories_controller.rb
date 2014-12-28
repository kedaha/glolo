class ItemCategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with ItemCategory.select(:name, :id).order(:name)
  end

  def learn_keywords

  end
end

