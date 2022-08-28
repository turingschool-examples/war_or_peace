require './lib/card'
require './lib/deck'
require 'pry'

class Player

    attr_reader :player_name,
                :deck


    def initialize(player_name, deck)

        @player_name = player_name
        @deck = deck

    end

    def has_lost?

        @deck.cards.empty?

    end

end
