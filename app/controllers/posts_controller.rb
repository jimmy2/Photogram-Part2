class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      flash[:success] = "Post updated hombre."
      redirect_to @post
    else
      flash[:alert] = "Something is wrong with your form!"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Problem solved!  Post deleted."
    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
