require 'byebug'

def convert_height(height_string)
    new_height = 0

    case height_string
        when "5-3","5-03"
            new_height = 63
        when"5-4","5-04"
            new_height = 64
        when"5-5","5-05"
            new_height = 65
        when"5-6","5-06"
            new_height = 66
        when"5-7","5-07"
            new_height = 67
        when"5-8","5-08"
            new_height = 68
        when"5-9","5-09"
            new_height = 69
        when"5-10"
            new_height = 70
        when"5-11"
            new_height = 71
        when"6-0","6-00"
            new_height = 72
        when"6-1","6-01"
            new_height = 73
        when"6-2","6-02"
            new_height = 74
        when"6-3","6-03"
            new_height = 75
        when"6-4","6-04"
            new_height = 76
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