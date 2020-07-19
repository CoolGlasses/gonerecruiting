def convert_height(height_string)
    new_height = 0

    case height_string
        when "5-0","5-00","5' 0","5' 00"
            new_height = 60 
        when "5-1","5-01","5' 1" 
            new_height = 61
        when "<5ft 3in","5-2","5-02","5' 2","5'02"
            new_height = 62 
        when "5-3","5-03","5ft 3in","5' 3","5'03"
            new_height = 63
        when "5-4","5-04","5ft 4in","5' 4","5'04"
            new_height = 64
        when "5-5","5-05","5ft fin","5' 5","5'05"
            new_height = 65
        when "5-6","5-06","5ft 6in","5' 6","5'06"
            new_height = 66
        when "5-7","5-07","5ft 7in","5' 7","5'07"
            new_height = 67
        when "5-8","5-08","5ft 8in","5' 8","5'08"
            new_height = 68
        when "5-9","5-09","5ft 9in","5' 9","5'09"
            new_height = 69
        when "5-10","5ft 10in","5'10","5' 10"
            new_height = 70
        when "5-11","5ft 11in","5'11","5' 11"
            new_height = 71
        when "6-0","6-00","6ft 0in","6'00","6' 00"
            new_height = 72
        when "6-1","6-01","6ft 1in","6' 1","6' 01"
            new_height = 73
        when "6-2","6-02","6ft 2in","6' 2","6' 02"
            new_height = 74
        when "6-3","6-03","6ft 3in","6' 3","6' 03"
            new_height = 75
        when "6-4","6-04","6ft 4in","6' 4","6' 04"
            new_height = 76
        when ">6ft 4in","6'05","6' 05"
            new_height = 77
        when "6-6","6-06","6' 6","6' 06"
            new_height = 78
        when "6-7","6-07","6' 7","6' 07"
            new_height = 79
        when "6-8","6-08","6' 8","6' 08"
            new_height = 80
        when "6-9","6-09","6' 9","6' 09"
            new_height = 81
        end
    return new_height
end

def format_height(height_string)
    new_height = 0

    case height_string
        when "5-0","5' 0","5' 00"
            new_height = "5-00" 
        when "5-1","5-01","5' 1" 
            new_height = "5-01" 
        when "<5ft 3in","5-2","5-02","5' 2","5'02"
            new_height = "5-02"  
        when "5-3","5-03","5ft 3in","5' 3","5'03"
            new_height = "5-03" 
        when "5-4","5-04","5ft 4in","5' 4","5'04"
            new_height = "5-04" 
        when "5-5","5-05","5ft fin","5' 5","5'05"
            new_height = "5-05" 
        when "5-6","5-06","5ft 6in","5' 6","5'06"
            new_height = "5-06" 
        when "5-7","5-07","5ft 7in","5' 7","5'07"
            new_height = "5-07" 
        when "5-8","5-08","5ft 8in","5' 8","5'08"
            new_height = "5-08" 
        when "5-9","5-09","5ft 9in","5' 9","5'09"
            new_height = "5-09" 
        when "5-10","5ft 10in","5'10","5' 10"
            new_height = "5-10" 
        when "5-11","5ft 11in","5'11","5' 11"
            new_height = "5-11" 
        when "6-0","6-00","6ft 0in","6'00","6' 00"
            new_height = "6-00"
        when "6-1","6-01","6ft 1in","6' 1","6' 01"
            new_height = "6-01"
        when "6-2","6-02","6ft 2in","6' 2","6' 02"
            new_height = "6-02"
        when "6-3","6-03","6ft 3in","6' 3","6' 03"
            new_height = "6-03"
        when "6-4","6-04","6ft 4in","6' 4","6' 04"
            new_height = "6-04"
        when ">6ft 4in","6'05","6' 05"
            new_height = "6-05"
        when "6-6","6-06","6' 6","6' 06"
            new_height = "6-06"
        when "6-7","6-07","6' 7","6' 07"
            new_height = "6-07"
        when "6-8","6-08","6' 8","6' 08"
            new_height = "6-08"
        when "6-9","6-09","6' 9","6' 09"
            new_height = "6-09"
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