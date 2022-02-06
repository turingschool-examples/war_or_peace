require 'pry'

def start
    # array of possible suits
    suits = [:heart, :spade, :diamond, :club]
    #create cards for the deck
    cards = []
    suits.each do |suit|
      cards << ['2', suit, 2]
      puts ":2,#{suit},2"
      cards << ['3', suit, 3]
      puts "3,:#{suit}, 3"
      cards << ['4', suit,4]
      puts "4,:#{suit}, 4"
      cards << ['5', suit,5]
      puts "5,:#{suit}, 5"
      cards << ['6', suit,6]
      puts "6,:#{suit}, 6"
      cards << ['7', suit,7]
      puts "7,:#{suit}, 7"
      cards << ['8', suit,8]
      puts "8,:#{suit}, 8"
      cards << ['9', suit,9]
      puts "9,:#{suit}, 9"
      cards << ['10', suit,10]
      puts "10,:#{suit}, 10"
      cards << ['Jack', suit,11]
      puts "Jack,:#{suit}, 11"
      cards << ['Queen', suit,12]
      puts "Queen,:#{suit}, 12"
      cards << ['King', suit,13]
      puts "King,:#{suit}, 13"
      cards << ['Ace', suit,14]
      puts "Ace,:#{suit}, 14"
    end
#binding.pry
end
start
