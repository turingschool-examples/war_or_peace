require './lib/card'

class Game
  attr_reader :deck
              :suits
  def initialize
    @suits = [:heart, :diamond, :spade, :club]
    @deck = []
  end

  def new_deck
    @suits.map do |suit|
      (2..14).each do |card|
        if card > 1
          @deck << Card.new(suit, value, card)
          require "pry"; binding.pry
        else
      end
    end
  end

  end
end
