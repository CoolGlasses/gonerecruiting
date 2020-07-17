require "nokogiri"
require "open-uri"
require "pry"

browser = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1'

#go to starting point
doc = Nokogiri::HTML(open('http://www.2bcentral.com/index.php?pid=0.31.245.12.320',
                        'User-Agent' => '#{browser}'))

#create an array of all possible sites
@final_list_of_schools = []
@list_of_schools = doc.css('div.wpa_navbarx').css('table').css('td').css('option')

@list_of_schools.each do |school|
    @final_list_of_schools << school["value"]
end

#go to every school
# @final_list_of_schools.each do |url|
#     @school = Nokogiri::HTML(open('#{url}', 'User-Agent' => '#{browser}'))
    #identify url of specifically the girls basketball sub-page..have to iterate throught the girls sports element in case a season (fall/winter/spring) is not present

        # @girls_url_nodes = @school.xpath('//*[@id="school_menu_container"]/table/tr/td[2]/div/div/table/tr[3]/td/a')
        # @girls_url_finally = ""
        # @girls_url_nodes.each do |node|
        #     if node.text.to_s == "Basketball"
        #         @girls_url_finally = node["href"]
        #     end
        # end


        #go to the sub-page

        # @roster_page = Nokogiri::HTML(open('#{@girls_url_finally}', 'User-Agent' => '#{browser}'))

        #add team to database

        #add the roster to an array

        # @roster_array = []

        # @roster_html = @roster_page.css('#tbl_roster td')
        # @roster_html.each do |data|
        #     @roster_array << data.text
        # end

        #add players to database with the above team id to track them back to the team



        #Home Away Height Position Year Games Pts Avg
        # i = 0    
        # player = []
        # @final_roster = []
        # while i < @roster_array.length
        #     counter = 0


        #     player << @roster_array[counter]
        #     i += 1
        #     counter += 1

        #     if counter == 7
        #         counter = 0
        #         @final_roster << player
        #         player = []
        #     end
        # end


binding.pry