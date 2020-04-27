class Athletic_directorsController < ApplicationController

    def index
        render json: Athletic_director.all
    end

    def show
        render json: Athletic_director.find(params[:id])
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