class PlayersController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @players = ActiveRecord::Base.connection.execute(<<-SQL)
        SELECT 
            players.name, players.position, players.height, players.grade, schools.name AS School
        FROM
            players
        JOIN
            teams
        ON
            players.team_id = teams.osaa_team_id
        JOIN
            schools
        ON
            teams.osaa_school_id = schools.osaa_school_id
        SQL
        @players.to_a
        render :index
    end
    
    def filter
        name = ""
        height = ""
        position = ""
        grade = ""
        school = ""

        params[filter].each do |k, v|
            case k
            when :name
                name = v
            when :height
                height = v
            when :position
                position = v
            when :grade
                grade = v
            when :school
                school = v
            end
        end



        render json: params
    end
    
    def show
        render json: Player.find(params[:id])
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

    # def curate_height(players)
    #     players.each do |player|
    #         height = player.height
    #         case height
    #         when ""
    #             height = 0
    #         when "4-5","4-05"
    #             height = 53
    #         when "4-6","4-06"
    #             height = 54
    #         when "4-7","4-07"
    #             height = 55
    #         when "4-8","4-08"
    #             height = 56
    #         when "4-9","4-09"
    #             height = 57
    #         when "4-10"
    #             height = 58
    #         when "4-11"
    #             height = 59
    #         when "5-0","5-00"
    #             height = 60
    #         when "5-1","5-01"
    #             height = 61
    #         when "5-2","5-02"
    #             height = 62
    #         when "5-3","5-03"
    #             height = 63
    #         when "5-4","5-04"
    #             height = 64
    #         when "5-5","5-05"
    #             height = 65
    #         when "5-6","5-06"
    #             height = 66
    #         when "5-7","5-07"
    #             height = 67
    #         when "5-8","5-08"
    #             height = 68
    #         when "5-9","5-09"
    #             height = 69
    #         when "5-10"
    #             height = 70
    #         when "5-11"
    #             height = 71
    #         when "6-0","6-00"
    #             height = 72
    #         when "6-1","6-01"
    #             height = 73
    #         when "6-2","6-02"
    #             height = 74
    #         when "6-3","6-03"
    #             height = 75
    #         when "6-4","6-04"
    #             height = 76
    #         when "6-5","6-05"
    #             height = 77
    #         when "6-6","6-06"
    #             height = 78
    #         when "6-7","6-07"
    #             height = 79
    #         when "6-8","6-08"
    #             height = 80
    #         when "6-9","6-09"
    #             height = 81
    #         when "6-10"
    #             height = 82
    #         when "6-11"
    #             height = 83
    #         when "7-0","7-00"
    #             height = 84
    #         else
    #             height = 0
    #         end
    #         player.height = height
    #     end
    #     return players
    # end

end