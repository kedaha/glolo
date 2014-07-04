class PostsController < ApplicationController
  respond_to :html, :json

  def new
    @post = Post.new
  end

  def create

  end
end
