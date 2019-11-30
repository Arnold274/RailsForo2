class PostsController < ApplicationController
    before_action :find_post, except: [:new, :create, :index]
    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(title: params[:post][:title], status: 1, 
                            content: params[:post][:content], user: current_user)
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
