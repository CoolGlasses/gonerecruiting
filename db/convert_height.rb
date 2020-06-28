def convert_height(height_string)
    new_height = 0

    case height_string
        when "<5ft 3in"
            new_height = 62 
        when "5-3","5-03","5ft 3in"
            new_height = 63
        when "5-4","5-04","5ft 4in"
            new_height = 64
        when "5-5","5-05","5ft fin"
            new_height = 65
        when "5-6","5-06","5ft 6in"
            new_height = 66
        when "5-7","5-07","5ft 7in"
            new_height = 67
        when "5-8","5-08","5ft 8in"
            new_height = 68
        when "5-9","5-09","5ft 9in"
            new_height = 69
        when "5-10","5ft 10in"
            new_height = 70
        when "5-11","5ft 11in"
            new_height = 71
        when "6-0","6-00","6ft 0in"
            new_height = 72
        when "6-1","6-01","6ft 1in"
            new_height = 73
        when "6-2","6-02","6ft 2in"
            new_height = 74
        when "6-3","6-03","6ft 3in"
            new_height = 75
        when "6-4","6-04","6ft 4in"
            new_height = 76
        when ">6ft 4in"
            new_height = 77
        end
    return new_height
end

# def run_conversion
#     @players = Player.all
#     @players.each do |player|
#         height_inches = convert_height(player[:height])
#         player[:height_inches] = height_inches
#         player.update
#     end
# end