require "nokogiri"
require "open-uri"
require "pry"
require_relative 'convert_height'
require 'byebug'

@browser = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1'

#go to starting point
doc = Nokogiri::HTML(open('http://www.2bcentral.com/index.php?pid=0.31.245.12.320',
                        'User-Agent' => '#{@browser}'))

#create an array of all possible sites
@final_list_of_schools = []
@list_of_schools = doc.css('div.wpa_navbarx').css('table').css('td').css('option')

@list_of_schools.each do |school|
    @final_list_of_schools << school["value"]
end

school_id = 420001
@final_list_of_schools.shift

debugger
#go to every school
@final_list_of_schools.each do |address|
    @school = Nokogiri::HTML(open(address, 'User-Agent' => '#{@browser}'))
    #identify url of specifically the girls basketball sub-page..have to iterate throught the girls sports element in case a season (fall/winter/spring) is not present

        @girls_url_nodes = @school.xpath('//*[@id="school_menu_container"]/table/tr/td[2]/div/div/table/tr[3]/td/a')
        @girls_url_finally = ""
        @girls_url_nodes.each do |node|
            if node.text.to_s == "Basketball"
                @girls_url_finally = node["href"]
            end
        end


#       #go to the sub-page
        #have to check whether or not this page uses javascript to load its tab or if the info is located at a seperate url
        @basketball_page = Nokogiri::HTML(open(@girls_url_finally, 'User-Agent' => '#{@browser}'))
        if @basketball_page.css('#roster_header').empty?
            new_url = @basketball_page.css('.page_title > div:nth-child(1) > div:nth-child(2) > a:nth-child(3)').attribute('href')
            @roster_page = Nokogiri::HTML(open(new_url, 'User-Agent' => '#{@browser}'))
            header = @roster_page.css('#roster_header div div')
            year = header.text[0..3].to_i ##need this for the year column on the school table
            @basketball_page = @roster_page
        else
            header = @basketball_page.css('#roster_header div div')
            year = header.text[0..3].to_i ##need this for the year column on the school table
        end

        state = "WA"

        #need to grab the school name from the header bar at the top of the page.  It is uniform, can be grabbed from all variations

        #create school, add it to the database

        #school and team ids for the state of washington start with the number 42 -- 42nd state of the union
        #the 4 digits that follow the number 42 on the id start at 0001 and increment up with ever iteration
        #there is no other reasoning behind this other than to attempt to ensure the made up ids are not duplicated when other states are added


        #add team to database, reference school id created above... this will not be the primary key of the school table
        #
        #
        #add the roster to an array

        @roster_array = []

        @headers = Hash.new
        #identify headers on of the roster
        @basketball_page.css('#tbl_roster th').each_with_index do |header, i|
            if header == "H#"
                fixed_header = "H"
            elsif header == "A#"
                fixed_header = "A"
            else
                fixed_header = header
            end

            @headers[i] = fixed_header
        end

        length = @headers.length

        @roster_html = @basketball_page.css('#tbl_roster td')
        @roster_html.each do |data|
            @roster_array << data.text
        end

        #H# A# Name Height Position Year Games Pts Avg
        i = 0    
        player = {
            H: nil,
            A: nil,
            Name: "",
            Height: "",
            Year: ""
        }
        keys = player.keys
        @final_roster = [] #meant to be an array of hashes
        counter = 0
        debugger
        while i < @roster_array.length
            player[keys[counter]] = @roster_array[counter]

            i += 1
            counter += 1

            if counter == length
                counter = 0
                @final_roster << player
                player = {
                    H: nil,
                    A: nil,
                    Name: "",
                    Height: "",
                    Position: "",
                    Year: "",
                    Games: 0,
                    Pts: 0,
                    Avg: 0
                }
            end
        end

        debugger

        @final_roster.each do |player|
            if !player[:height].nil?
                height_inches = convert_height(player[:height])
            else
                height_inches = 0
            end

            if !player[:Year].nil?
                grade = convert_year(player[:Year]) ##NEED TO CREATE THIS!!!
            else
                grade = ""
            end

            Player.create!(
                name: "#{player[:name]}",
                home_number: "#{player[:H]}",
                away_number: "#{player[:A]}",
                position: "#{player[:Position]}",
                grade: "#{grade}",
                height: "#{player[:height]}",
                team_id: "#{school_id}",
                height_inches: "#{height_inches}"
            )
        end


        #add players to database with the above team id to track them back to the team...this will not be the primary key of the teams table





    school_id += 1
end


binding.pry