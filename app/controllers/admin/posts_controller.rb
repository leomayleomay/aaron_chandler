class Admin::PostsController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.build_access_restriction
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to admin_posts_path, :notice => "Post created!"
    else
      render [:admin, :new]
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to admin_posts_path, :notice => "Post updated!"
    else
      render [:admin, :update]
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to admin_posts_path, :notice => "Post destroyed!"
  end
end
