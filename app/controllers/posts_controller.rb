class PostsController < ApplicationController
  respond_to :html, :json

  def new
    @post = current_user.posts.last || Post.create!(user: current_user)
    @page_data = PostSerializer.new(@post)

    render :edit
  end

  def edit
    @post = Post.find(parms[:id])
  end

  def current
    post = current_user.posts.last || Post.create(user: current_user)

    render json: post
  end
end
