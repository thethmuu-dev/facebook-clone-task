class PostsController < ApplicationController
    before_action :set_post, only: [:show, :destroy, :edit, :update]
    before_action :require_user, except: [:show, :index]
    before_action :owner_check, only: [:edit, :update, :destroy]
    def index
        @posts = Post.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path, notice: "Post Posted!"
        else
            @posts = Post.order('created_at DESC')
            render :index
        end
    end

    def show
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: "Post Updated!"
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path, notice: "Post Deleted"
    end

    private
    def post_params
        params.require(:post).permit(:content, :image)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def owner_check
        if current_user != @post.user
          flash[:alert] = "You can only edit or delete your own posts"
          redirect_to @post
        end
    end
end
