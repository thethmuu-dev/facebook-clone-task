class ImagePostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :owner_check, only: [:edit, :update, :destroy]

  def index
    @image_posts = ImagePost.all
  end

  def show
  end

  def new
    @post = ImagePost.new
  end

  def edit
  end

  def create
    @post = ImagePost.new(post_params)
    @post.user = current_user
    if params[:back]
      render :new
    else
      if @post.save
        flash[:notice] = "Post Created"
        redirect_to @post
      else
        render 'new'
      end
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post Updated!"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post Deleted!"
      redirect_to images_path
    end
  end

  def confirm
    @image_post = ImagePost.new(post_params)
    @image_post.user = current_user
    render 'new' if @image_post.invalid?
  end

  private

  def set_post
    @image_post = ImagePost.find(params[:id])
  end

  def post_params
    params.require(:image).permit(:name, :picture, :picture_cache, :user_id)
  end

  def owner_check
    if current_user != @image.user
      flash[:alert] = "You can only edit or delete your own posts"
      redirect_to @image
    end
  end

end