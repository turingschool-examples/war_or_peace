require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


@suits = [:heart, :diamond, :spade, :club]
@values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13']
@rank = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
@cards = []
def populate_deck
  if @cards == []
    @suits.each do |current_suit|
      suit = current_suit
      @values.each do |current_value|
        value = current_value
        rank = value.to_i
        suit_value = Card.new(suit, value, rank)
        @cards << suit_value
      end
    end
  else
    puts 'Cards left over, unsure how to respond'
  end
end

populate_deck

puts @cards.count
# card1 = Card.new(suit[0], value[0], rank[0])
# card2 = Card.new(suit[0], value[1], rank[1])
# card3 = Card.new(suit[0], value[2], rank[2])
# card4 = Card.new(suit[0], value[3], rank[3])
# card5 = Card.new(suit[0], value[4], rank[4])
# card6 = Card.new(suit[0], value[5], rank[5])
# card7 = Card.new(suit[0], value[6], rank[6])
# card8 = Card.new(suit[0], value[7], rank[7])
# card9 = Card.new(suit[0], value[8], rank[8])
# card10 = Card.new(suit[0], value[9], rank[9])
# card11 = Card.new(suit[0], value[10], rank[10])
# card12 = Card.new(suit[0], value[11], rank[11])
# card13 = Card.new(suit[0], value[12], rank[12])
# card14
# card15
# card16
# card17
# card18
