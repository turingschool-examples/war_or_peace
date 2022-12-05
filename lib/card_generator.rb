
require './lib/game'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class CardGenerator
    attr_reader :filename,
                :cards

    def initialize(filename)
        @filename = filename
        @cards = []
    end

    def read
        array = File.readlines(filename)
        
        array.each do |card|
            card_array = card.downcase.scan(/\w+/)

            card_elements = Card.new(card_array[1].to_sym, card_array[0], card_array[2].to_i)

            cards << card_elements
        end
    end
end