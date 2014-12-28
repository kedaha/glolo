class PostCategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with PostCategory.select(:name, :id).order(:name)
  end
end

