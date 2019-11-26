class PublicationsController < ApplicationController
    
    def new
        @publication = Publication.new
        @publication.status = 1
    end

    def create
        @publication = Publication.create(title: params[:title][:articule], articule: params[:title][:articule])
        render json: @publication
    end

    def show
        @publication = Publication.find(params[:id])
    end

    def edit
        @publication = Publication.find(params[:id])
    end

    def update
        @publication = Publication.find(params[:id])
        @Publication.update(title: params[:title][:articule], articule: params[:title][:articule])
        redirect_to @publication
    end

    def destroy
    end
end
