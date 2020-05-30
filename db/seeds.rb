# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faraday'
require 'byebug'
require 'json'
require_relative 'convert_height'

# x-api-key = DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe

# x-api-user = $2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq

def get_team_table
    team_conn = Faraday.new(
        url: 'http://www.osaa.org/api/teams/gbx',
        headers: {'x-api-key' => 'DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe',
                'x-api-user' => '$2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq'
                })

    team_resp = team_conn.get  #returns an array of hashes, each hash is a team

    body = team_resp.body

    parsed = JSON.parse(body)
    return parsed
end

def get_school_table #not currently returning staff as part of the school hash
    school_conn = Faraday.new(
        url: 'http://www.osaa.org/api/schools',
        headers: {'x-api-key' => 'DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe',
                  'x-api-user' => '$2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq'
                 })

    school_resp = school_conn.get

    body = school_resp.body

    parsed = JSON.parse(body)
    return parsed
end


def write_team_to_db(parsed_team)

    parsed_team.each do |team|
        year = team["year"]
        # record = team["overall_record"]
        osaa_school_id = team["school"]
        osaa_team_id = team["id"]
        roster = team["roster"]
        social_media = team["social_media"]
        team_photo_url = team["team_photo"]

        Team.create!(
            osaa_school_id: "#{osaa_school_id}",
            osaa_team_id: "#{osaa_team_id}",
            social_media: "#{social_media}",
            team_photo_url: "#{team_photo_url}"
        )

        # if !roster.nil?
        #     roster.each do |player|
        #         write_player_to_db(player, osaa_team_id)
        #     end
        # end
    end
end

def write_player_to_db(player, osaa_team_id)
        name = player["name"]
        home_number = player["home_number"]
        away_number = player["away_number"]
        position = player["position"]
        grade = player["grade"]
        height = player["height"]
        height_inches = convert_height(height)

        Player.create!(
            name: "#{name}",
            home_number: "#{home_number}",
            away_number: "#{away_number}",
            position: "#{position}",
            grade: "#{grade}",
            height: "#{height}",
            team_id: "#{osaa_team_id}",
            height_inches: "#{height_inches}"
        )
end


def write_school_to_db(parsed_school)
    parsed_school.each do |school|
        name = school["name"]
        classification = school["classification"]
        mascot = school["mascot"]["main"]
        color_1 = school["colors"][0]["name"]
        color_2 = school["colors"][1]["name"]
        # color_3 = school["colors"][2]["name"]
        year = school["year"]
        osaa_school_id = school["id"]
        league = school["league_full_name"]
        social_media = school["social_media"] #returns hash
        # athletic_director = school["school_staff"]["Athletic Director"] #is a hash
        # coach = school["team_staff"]["GBX"] #is probably a hash of the entire staff

        School.create!(
            name: "#{name}",
            classification: "#{classification}",
            mascot: "#{mascot}",
            color_1: "#{color_1}",
            color_2: "#{color_2}",
            # color_3: "#{color_3}",
            year: "#{year}",
            osaa_school_id: "#{osaa_school_id}",
            social_media: "#{social_media}"
        ) 
    end
end


def write_full_players_to_db(parsed_team, parsed_school)
    parsed_team.each do |team|
        school_name = ""
        classification = ""
        mascot = ""
        color_1 = ""
        color_2 = ""
        league = ""
        parsed_school.each do |school|
            if team["school"] == school["id"]
                school_name = school["name"]
                classification = school["classification"]
                mascot = school["mascot"]["main"]
                color_1 = school["colors"][0]["name"]
                color_2 = school["colors"][1]["name"]
                league = school["league_full_name"]
                break
            end
        end
        
        osaa_team_id = team["id"]
        roster = team["roster"]

        if !roster.nil?
            roster.each do |player|
                name = player["name"]
                home_number = player["home_number"]
                away_number = player["away_number"]
                position = player["position"]
                grade = player["grade"]
                height = player["height"]
                height_inches = convert_height(height)

                Player.create!(
                    name: "#{name}",
                    home_number: "#{home_number}",
                    away_number: "#{away_number}",
                    position: "#{position}",
                    grade: "#{grade}",
                    height: "#{height}",
                    team_id: "#{osaa_team_id}",
                    height_inches: "#{height_inches}",
                    school_name: "#{school_name}",
                    classification: "#{classification}",
                    mascot: "#{mascot}",
                    color_1: "#{color_1}",
                    color_2: "#{color_2}",
                    league: "#{league}"
                )
            end
        end
    end
end


parsed_team = get_team_table()
parsed_school = get_school_table()
write_school_to_db(parsed_school)
write_team_to_db(parsed_team)
write_full_players_to_db(parsed_team, parsed_school)


