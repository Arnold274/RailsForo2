class PostsController < ApplicationController

    before_filter :authenticate_user!, except: [:index, :show]
    before_filter :find_post, only: [:show, :edit, :update, :destroy]

    def index
    #@posts = Post.all
    @posts = Post.order('created_at DESC').page(params[:page]).per(15)
    end

  def show
  end

    def new
    @post = Post.new
    end

  def create
    @user = current_user
    @post = @user.posts.build(allowed_params)

    if @post.save
      flash[:success] = "Created new post"
      redirect_to @post
    else
      render 'new'
    end
  end

    def edit
    redirect_to posts_path unless @post.user == current_user
    end

  def update
    if @post.user == current_user
      if @post.update_attributes(allowed_params)
        flash[:success] = "Updated post"
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to posts_path
      flash[:notice] = "You can't do this"
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path
      flash[:success] = "deleted post"
    else
      redirect_to root_path
      flash[:danger] = "You can't do this"
    end
  end

  private
    def allowed_params
      params.require(:post).permit(:title, :body)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end