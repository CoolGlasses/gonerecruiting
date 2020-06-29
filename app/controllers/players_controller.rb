require_relative  'convert_height.rb'

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

        if !current_user.nil?
            @recruits = get_recruits(current_user)
        end
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
                @players = Player.height_filter(converted_height)
            else
                @players = @players.height_filter(converted_height)
            end
        end

        if grade != "" && !grade.nil?
            if @players.nil?
                @players = Player.grade_filter(grade)
            else
                @players = @players.grade_filter(grade)
            end
        end

        if !position.nil?
            if @players.nil?
                @players = Player.position_filter(position)
            else
                @players = @players.position_filter(position)
            end
        end

        if school != ""
            if @players.nil?
                @players = Player.school_filter(school)
            else
                @players = @players.school_filter(school)
            end
        end

        if player_name != "" && !player_name.nil?
            if @players.nil?
                @players = Player.name_filter(player_name)
            else
                @players = @players.name_filter(player_name)
            end
        end

        if !current_user.nil?
            @recruits = get_recruits(current_user)
        end

        @players.to_a
        render :index
    end
    
    def show
        @player = Player.find(params[:id])
        if !current_user.nil?
            @notes = get_notes(current_user, @player)
            @contact_card = get_contact_card(current_user, @player)
            @recruits= get_recruit(current_user)
        else
            @notes = false 
            @contact_card = false
        end

        @schedule = get_schedule(@player)
        render :show
    end

    protected
    def get_notes(current_user, player)
        notes = Note.where("user_id = ?", current_user.id)
        notes = notes.where("player_id = ?", player.id)
        notes = notes.to_a
        return notes
    end

    def get_contact_card(current_user, player)
        contact_card = ContactCard.where("player_id = ?", player.id)
        contact_card = contact_card.where("user_id = ?", current_user.id)
        contact_card = contact_card.to_a

        return contact_card
    end

    def get_schedule(player)
        player = Player.find_by("id = ?", player.id)
        team_id = Team.where("osaa_team_id = ?", player.team_id)
        schedule = Contest.where("home_id = ?", team_id[0].osaa_team_id).or(Contest.where("away_id = ?", team_id[0].osaa_team_id))
        schedule = schedule.to_a
        schedule = bubble_sort(schedule)

        return schedule
    end

    def get_recruits(current_user)
        recruits = Recruit.where("user_id = ?", current_user.id)

        players = recruits.uniq.map do |recruit|
            Player.where("id = ?", recruit.player_id)
        end

        players = players.flatten
        return players
    end

    def get_recruit(current_user)
        recruit = Recruit.where("user_id = ?", current_user.id)
        recruit = recruit.to_a

        player = Player.where("id = ?", recruit[0]["player_id"])

        return player
    end

    def bubble_sort(schedule)
        length = schedule.length
        loop do
           swapped = false
           (length - 1).times do |i|
                if schedule[i]["start_at"] > schedule[i + 1]["start_at"]
                    
                    schedule[i], schedule[i + 1] = schedule[i + 1], schedule[i]

                    swapped = true
                end
            end

            break if swapped == false
        end
        return schedule
    end
end