class ContestsController < ApplicationController
    def index
        render json: Contest.all
    end

    def show
        render json: Contest.find(params[:id])
    end

    def new
    end

    def create
    end

    def update
    end

    def edit
    end

    def destroy
    end
end