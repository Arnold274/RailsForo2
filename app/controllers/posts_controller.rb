class PostsController < ApplicationController
    before_action :find_post, except: [:new, :create, :index]

    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(title: params[:post][:title], status: 1, content: params[:post][:content])
        render json: @post
    end

    def show

    end

    def edit

    end

    def update
        @post.update(title: params[:post][:title], status: 1, content: params[:post][:content])
        redirect_to @post
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
