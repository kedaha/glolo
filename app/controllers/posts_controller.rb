class PostsController < ApplicationController
  respond_to :json, only: [:create, :update, :destroy]
  respond_to :html, only: [:new, :edit]

  def new
    @post = current_user.posts.find_by(completed_at: nil) || current_user.posts.build
    render :edit
  end

  def create
    post = current_user.posts.create!(post_create_params)
    render json: post.serializer
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    post = current_user.posts.find(params[:id])
    post.update_attributes(post_params)
    render json: post.serializer
  end

  def destroy
    render json: current_user.posts.find(params[:id]).destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :contact_profile_id, :category_id)
  end

  def post_create_params
    params.require(:post).permit(:type)
  end
end
