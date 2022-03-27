require './lib/deck'
require './lib/card'
require 'pry'
class Deck
  attr_reader :cards#just another way to have methods available

    def initialize(cards)#.new calls this methoed in my rpsec file must get one parameter
      @cards = cards#saying my @card attribute is equal the parameter cards

    end


    def rank_of_card_at(index)#creating a index parameter
      @cards[index].rank#having my parameter look through my card attribute
      #and using the rank attribute from card.rb to rank all the current cards
    end

    def high_ranking_cards
      high_cards = []#giving myself a new array to put the high ranked cards into
      @cards.each do |card|#calling my @cards attribute from above to make and each do saying before each card do this
        if card.rank > 10#saying before each card look at its rank(attribute with card.rb) and give them to me if theyre greater than 10
          high_cards << card#calling my array and saying shovel(<<) my card(block variable) to my high_cards
        end
    end

    return high_cards#prints the return for my above method

    end

    def percent_high_ranking_cards

      percent = high_ranking_cards.count.to_f / @cards.count * 100#this takes the .count to turn the array to an integer
#and takes the total cards (@cards) and .count to get an integer so divide high cards by total cards and multiply by 100
      percent.round(2)#rounds the answer to make it 66.67 not 66.66 calling round and the (2) decimal spot
    end

    def remove_card
      @cards.shift#the .shift is a ruby method to remove the first arguemnt in an array

    end

    def add_card(new_card)#give my add card and arguement becuase i am getting a new array
      @cards << new_card#this is putting a new card into my total(@cards)
    end
end
