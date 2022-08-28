require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

require 'pry'

class CardGenerator

    attr_reader :deck1,
                :deck2

    def initialize(file_name)


        file_data = File.open(file_name)

        list =  file_data.readlines.map(&chomp)

        full_deck_cards =[]

        list.each do |element|

            element.flatten

            suit = element[0]

            value = element[1]

            rank = element[2]

            

            full_deck_cards  << Card.new(suit, value, rank)

        end

        full_deck_cards = full_deck_cards.shuffle
        half_deck_1 = []
        half_deck_2 = []


        26.times do
        half_deck_1 << full_deck_cards.shift
        end

        26.times do
        half_deck_2 << full_deck_cards.shift
        end

        @deck1 = Deck.new(half_deck_1)
        @deck2 = Deck.new(half_deck_2)


    end

end
#binding.pry
    


