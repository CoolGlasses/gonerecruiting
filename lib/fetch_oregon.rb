require 'faraday'
require 'byebug'
require 'json'
require 'pg'

# x-api-key = DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe

# x-api-user = $2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq



# def connect_to_db
#     db_conn = PG.connect( dbname: 'gone_recruiting_development')
#     return db_conn
# end

# def get_team_table
#     team_conn = Faraday.new(
#         url: 'http://www.osaa.org/api/teams/gbx',
#         headers: {'x-api-key' => 'DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe',
#                 'x-api-user' => '$2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq'
#                 })

#     team_resp = team_conn.get  #returns an array of hashes, each hash is a team

#     body = team_resp.body

#     parsed = JSON.parse(body)
#     return parsed
# end

# def get_school_table #not currently returning staff as part of the school hash
#     school_conn = Faraday.new(
#         url: 'http://www.osaa.org/api/schools',
#         headers: {'x-api-key' => 'DG8rhd7LDJ6MqwTvw8OUQQWWpjc75Tqe',
#                   'x-api-user' => '$2y$08$N4KDuEkBdzi8J0VlF9vWqeJSPkQCCbZ9v2YWnGv1BCSY5h44DjwTq'
#                  })

#     school_resp = school_conn.get

#     body = school_resp.body

#     parsed = JSON.parse(body)
#     return parsed
# end


# def write_team_to_db(parsed_team, db_conn)

#     parsed_team.each do |team|
#         year = team["year"]
#         record = team["overall_record"]
#         osaa_school_id = team["school"]
#         osaa_team_id = team["id"]
#         roster = team["roster"]
#         social_media = team["social_media"]
#         team_photo_url = team["team_photo"]

#         db_conn.exec(<<-SQL, osaa_school_id, osaa_team_id, record, year, social_media, team_photo_url)
#             INSERT INTO teams (osaa_school_id, osaa_team_id, record, year, social_media, team_photo_url)
#             VALUES (?, ?, ?, ?, ?, ?)
#         SQL


#         roster.each do |player|
#             write_player_to_db(player, osaa_team_id, db_conn)
#         end
#     end
# end

# def write_player_to_db(player, osaa_team_id, db_conn)
#         name = player["name"]
#         home_number = player["home_number"]
#         away_number = player["away_number"]
#         position = player["position"]
#         grade = player["grade"]
#         height = player["height"]

#         db_conn.exec(<<-SQL, name, position, height, grade, home_number, away_number, osaa_team_id)
#             INSERT INTO players (name, position, height, grade, home_number, away_number, team_id)
#             VALUES (?, ?, ?, ?, ?, ?, ?)
#             SQL
# end


# def write_school_to_db(parsed_school, db_conn)
#     name = school["name"]
#     classification = school["classification"]
#     mascot = school["mascot"]["main"]
#     colors = school["colors"] #hash of 3 colors
#     year = school["year"]
#     osaa_school_id = school["id"]
#     league = school["league_full_name"]
#     social_media = school["social_media"] #returns hash
#     # athletic_director = school["school_staff"]["Athletic Director"] #is a hash
#     # coach = school["team_staff"]["GBX"] #is probably a hash of the entire staff

#     db_conn.exec(<<-SQL, name, classification, mascot, colors, year, osaa_school_id, league, social_media)
#         INSERT INTO players (name, classification, mascot, colors, year, osaa_school_id, league, social_media)
#         VALUES (?, ?, ?, ?, ?, ?, ?, ?)
#         SQL
# end

# db_conn = connect_to_db()
# parsed_team = get_team_table()
# parsed_school = get_school_table()
# write_team_to_db(parsed_team, db_conn)
# write_school_to_db(parsed_school, db_conn)

lakers = Team.new

lakers.school_id = 789456123

puts lakers