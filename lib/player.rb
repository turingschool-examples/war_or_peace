require 'pry'
require_relative './deck'

class Player
    attr_reader :deck, :name

    def initialize(name, deck)
        @name = name
        @deck = deck 
    end 

    def has_lost?
        return true if @deck.cards.none?
        false
    end 
end 