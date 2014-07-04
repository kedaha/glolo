class CategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with Category.select(:name, :id).order(:name)
  end

  def learn_keywords

  end
end

