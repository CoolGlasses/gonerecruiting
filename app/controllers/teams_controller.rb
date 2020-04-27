class TeamController < ApplicationController

    def index
        render json: Team.all
    end

    def show
        render json: Team.find(params[:id])
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