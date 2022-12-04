# require 'pry'; binding.pry
class Player

    attr_reader :name, :deck
    def initialize(name, deck)
        @name = name
        @deck = deck
    end

    def has_lost? 
        @deck.cards.empty?
        # require 'pry'; binding.pry
    end

end