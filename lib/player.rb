require 'pry'
require './lib/card'
require './lib/deck'


class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.count > 0
      false
    else
      true
    end
  end

  # def has_won?
  #   if @deck.cards.count == 0
  #     false
  #   else
  #     true
  #   end
  # end


end
