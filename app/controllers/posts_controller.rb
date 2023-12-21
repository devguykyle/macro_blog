class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
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
end