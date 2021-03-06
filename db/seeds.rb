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
        url: 'http://www.osaa.org/api/teams/gbx?year=2019',
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
        url: 'https://www.osaa.org/api/schools?year=2019',
        headers: {'x-api-key' => 'DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe',
                  'x-api-user' => '$2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq'
                 })

    school_resp = school_conn.get

    body = school_resp.body

    parsed = JSON.parse(body)
    return parsed
end

def get_varsity_schedules
    schedule_conn = Faraday.new(
        url: 'https://www.osaa.org/api/contests/gbx?year=2019',
        headers: {'x-api-key' => 'DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe',
                'x-api-user' => '$2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq'
                })        

    schedule_resp = schedule_conn.get

    body = schedule_resp.body #array of hashes, each hash is a game between two teams

    parsed = JSON.parse(body)
    varsity_schedule = []
    
    parsed.each do |contest|
        if contest["level"] == "V"
            varsity_schedule << contest
        end
    end
    return varsity_schedule
end

def write_varsity_schedule_to_db(varsity_schedule)
    varsity_schedule.each do |contest|
        Contest.create!(
            status: "#{contest["status"]}",
            start_at: "#{contest["start_at"]}",
            home_id: "#{contest["home"]["id"]}", #maps to osaa_team_id
            home_win: "#{contest["home"]["is_win"]}",
            home_tie: "#{contest["home"]["is_tie"]}",
            home_forfeit: "#{contest["home"]["is_forfeit"]}",
            home_score: "#{contest["home"]["score"]}",
            home_name: "#{contest["home"]["name"]}",
            away_id: "#{contest["away"]["id"]}", #maps to osaa_team_id
            away_win: "#{contest["away"]["is_win"]}",
            away_tie: "#{contest["away"]["is_tie"]}",
            away_forfeit: "#{contest["away"]["is_forfeit"]}",
            away_score: "#{contest["away"]["score"]}",
            away_name: "#{contest["away"]["name"]}"
        )
    end
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
            height_inches: "#{height_inches}",
            state: "OR"
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
            social_media: "#{social_media}",
            state: "OR"
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
                    league: "#{league}",
                    state: "OR"
                )
            end
        end
    end
end


parsed_team = get_team_table()
parsed_school = get_school_table()
varsity_schedule = get_varsity_schedules()
write_varsity_schedule_to_db(varsity_schedule)
write_school_to_db(parsed_school)
write_team_to_db(parsed_team)
write_full_players_to_db(parsed_team, parsed_school)
