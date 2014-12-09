class CategoriesPostsController < ApplicationController
  respond_to :json

  def create
    respond_with CategoriesPost.create!(categories_posts_params)
  end

  private

  def categories_posts_params
    params.require(:categories_post).permit(:post_id, :category_id)
  end
end

