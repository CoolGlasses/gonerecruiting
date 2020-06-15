class SchoolsController < ApplicationController

    def index
        render json: School.all
    end

    def show
        render json: School.find(params[:id])
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