class PostsController < ApplicationController
  before_action :require_login, except: :show
  before_action :require_author, only: [:edit, :update, :destroy]

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

  def require_author
        @post = Post.find_by(id: params[:id])
        
        render json: "Forbidden", status: 403 unless @post.author_id == current_user.id
    end
end
