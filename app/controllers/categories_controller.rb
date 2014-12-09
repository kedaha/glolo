class CategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with Category.select(:name, :id).order(:name)
  end

  def remove
    respond_with CategoriesPost.find_by(post_id: categories_params[:post_id], category_id: categories_params[:id]).destroy
  end

  def learn_keywords

  end

  private

  def categories_params
    params
  end
end
