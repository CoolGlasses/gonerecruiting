class CoachesController < ApplicationController

    def index
        render json: Coach.all
    end

    def show
        render json: Coach.find(params[:id])
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