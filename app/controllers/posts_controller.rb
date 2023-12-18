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
          format.html { redirect_to @post, notice: 'Post successfully created' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new}
          format.json { render json: @post.errors, status: :unprocessable }
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post successfully created' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new}
        format.json { render json: @post.errors, status: :unprocessable }
      end
  end

  def delete
    @post.destroy
    respond_to do |format|
      format.html { render :new}
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