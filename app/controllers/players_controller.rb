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

        @players.to_a
        render :index
    end
    
    def filter
        name = params["filter"]["name"]
        height = params["filter"]["height"]
        position = params["filter"]["position"]
        school = params["filter"]["school"]
        grade = params["filter"]["grade"]

        if name != ""
            @players = name_filter(name)
        elsif !height.nil?
            @players = height_filter(height)
        elsif !position.nil?
            @players = position_filter(position)
        elsif school != ""
            @players = school_filter(school)
        elsif grade != ""
            @players = grade_filter(grade)
        end

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
        lower_case_name = name.downcase
        capitalized = lower_case_name[0].upcase + lower_case_name[1..-1]
        
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
            players.name LIKE '%#{lower_case_name}%'
        OR
            players.name LIKE '%#{capitalized}%';
        SQL

        return players
    end

    def school_filter(school)
        first_school = school.downcase
        second_school = first_school[0].upcase + first_school[1..-1]
        
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
            schools.name LIKE '%#{first_school}%'
        OR
            schools.name LIKE '%#{second_school}%';
        SQL

        return players
    end

    def height_filter(height)
        #need to care for the format that the height is coming in as better...  6ft 0in 
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