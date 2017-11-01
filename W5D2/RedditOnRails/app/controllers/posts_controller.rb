class PostsController < ApplicationController

  before_action :ensure_author, only: %i(edit create)
  
  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])

    if @post && @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

  def ensure_author
    unless current_user.posts.find_by(id: params[:id])
      redirect_to sub_url(params[:id])
    end
  end
end
