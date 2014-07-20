class PostsController < ApplicationController
  respond_to :json
  respond_to :html, only: :index

  def new
    @post = current_user.posts.build
    render :edit
  end

  def create
    respond_with current_user.posts.create!(post_params)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update

  end

  def destroy
    respond_with current_user.posts.find(params[:id]).destroy
  end

  private

  def post_params
    permitted = %w(id title contact_profile_id)
    params.require(:post).permit(permitted)
  end
end
