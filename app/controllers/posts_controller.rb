class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 2)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    if @post = Post.new(post_params)

      @post.user = current_user

      respond_to do |format|
        if @post.save
          flash[:notice] = 'Post successfully created'
          format.html { redirect_to @post }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new}
          format.json { render json: @post.errors, status: :unprocessable }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:notice] = 'Post successfully updated'
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :edit}
        format.json { render json: @post.errors, status: :unprocessable }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to post_path}
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def require_same_user
      if current_user != @post.user && !current_user.admin
        flash[:warn] = "You aren't authorized to perform that action"
        redirect_to posts_path
      end
    end
end