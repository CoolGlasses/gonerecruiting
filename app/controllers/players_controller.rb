require '/home/robin/gone_recruiting/db/convert_height.rb'

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

        gon.watch.filtered = false
        @players.to_a
        render :index
    end
    
    def filter
        player_name = params["filter"]["name"]
        height = params["filter"]["height"]
        position = params["filter"]["position"]
        school = params["filter"]["school"]
        grade = params["filter"]["grade"]

        filter_hash = {:height => height, :grade => grade, :position => position, 
                        :school => school, :player_name => player_name}

        filter_hash.each do |key, value|
            if value.nil? || value == ""
                filter_hash.except!(key)
            end
        end

        if !height.nil?
            @players = height_filter(height)
            filter_hash.except!(:height)
        elsif grade != "" && !grade.nil?
            @players = grade_filter(grade)
            filter_hash.except!(:grade)
        elsif !position.nil?
            @players = position_filter(position)
            filter_hash.except!(:position)
        elsif school != ""
            @players = school_filter(school)
            filter_hash.except!(:school)
        elsif player_name != "" && !player_name.nil?
            @players = name_filter(player_name)
            filter_hash.except!(:player_name)
        end

        gon.watch.filtered = true
        gon.watch.remaining_filters = filter_hash
        @players.to_a
        render :index
    end
    
    def show
        render json: Player.find(params[:id])
    end

    def grade_filter(grade)
        players = ActiveRecord::Base.connection.execute(<<-SQL)
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
        WHERE
            players.grade='#{grade}';
        SQL

        return players
    end

    def position_filter(position)
        players = ActiveRecord::Base.connection.execute(<<-SQL)
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
        WHERE
            players.position='#{position}';
        SQL

        return players
    end

    def name_filter(name)       
        players = ActiveRecord::Base.connection.execute(<<-SQL)
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
        WHERE
            LOWER(players.name) LIKE LOWER('%#{name}%')
        SQL

        return players
    end

    def school_filter(school)        
        players = ActiveRecord::Base.connection.execute(<<-SQL)
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
        WHERE
            LOWER(schools.name) LIKE LOWER('%#{school}%')
        SQL

        return players
    end

    def height_filter(height)
        converted_height = convert_height(height)

        if converted_height != 62
            players = ActiveRecord::Base.connection.execute(<<-SQL)
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
            WHERE
                players.height_inches >='#{converted_height}';
            SQL
            return players
        else
            players = ActiveRecord::Base.connection.execute(<<-SQL)
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
            WHERE
                players.height_inches <='#{converted_height}';
            SQL
            return players
        end
    end
end