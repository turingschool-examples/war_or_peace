#player class
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'


class Player
    attr_reader :deck, :name, :start

    def initialize (name, deck)
      @name = name
      @deck = deck
    end

    def has_lost?
      if @deck.cards.empty? == true
        return true
      else @deck.cards.empty? == false
        return false
      end
    end


end
