class PostTypesController < ApplicationController
  def index
    render json: PostType.all
  end
end
