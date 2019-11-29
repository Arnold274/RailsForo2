class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(title: params[:post][:title], status: 1, content: params[:post][:content])
        render json: @post
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(title: params[:post][:title], status: 1, content: params[:post][:content])
        redirect_to @post
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end
end
