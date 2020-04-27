class ConferencesController < ApplicationController

    def index
        render json: Conference.all
    end

    def show
        render json: Conference.find(params[:id])
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