require '/home/robin/gonerecruiting/db/convert_height.rb'

class PlayersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @players = Player.all
        @heightArray = [
            "<5ft 3in", "5ft 3in", "5ft 4in", "5ft 5in", "5ft 5in",
            "5ft 6in", "5ft 7in", "5ft 8in", "5ft 9in", "5ft 10in", "5ft 11in",
            "6ft 0in", "6ft 1in", "6ft 2in", "6ft 3in", "6ft 4in", ">6ft 4in"]
        @positionsArray = ["G", "W", "F", "P", "C"]
        @gradeArray = ["12", "11", "10", "9"]
    end
    
    def filter
        player_name = params["filter"]["name"].downcase
        height = params["filter"]["height"]
        position = params["filter"]["position"]
        school = params["filter"]["school"].downcase
        grade = params["filter"]["grade"]

        if !height.nil?
            converted_height = convert_height(height)
            if @players.nil?
                @players = Player.where("height_inches >= #{converted_height}")
                
            else
                @players = @players.where("height_inches >= #{converted_height}")
            end
        end

        if grade != "" && !grade.nil?
            if @players.nil?
                @players = Player.where("grade = ?", grade)
            else
                @players = @players.where("grade = ?", grade)
            end
        end

        if !position.nil?
            if @players.nil?
                @players = Player.where("position = ?", position)
            else
                @players = @players.where("position = ?", position)
            end
        end

        if school != ""
            if @players.nil?
                @players = Player.where("LOWER(school_name) LIKE ?", "%#{school}%")
            else
                @players = @players.where("LOWER(school_name) LIKE ?", "%#{school}%")
            end
        end

        if player_name != "" && !player_name.nil?
            if @players.nil?
                @players = Player.where("LOWER(name) LIKE ?", "%#{player_name}%")
            else
                @players = @players.where("LOWER(name) LIKE ?", "%#{player_name}%")
            end
        end

        @players.to_a
        render :index
    end
    
    def show
        @player = Player.find(params[:id])
        render :show
    end
end