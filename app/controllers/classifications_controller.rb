class ClassificationsController < ApplicationController

    def index
        render json: Classification.all
    end

    def show
        render json: Classification.find(params[:id])
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