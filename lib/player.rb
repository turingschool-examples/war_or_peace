require './lib/card'
require './lib/deck'
require 'pry'

class Player

    attr_reader :name,
                :deck


    def initialize(player_name, deck)

        @name = player_name
        @deck = deck

    end

    def has_lost?

        @deck.cards.empty?

    end

end
