class PostsController < ApplicationController
  load_and_authorize_resource

  caches_action :show

  def show
    @post = Post.find(params[:id])
  end
end
