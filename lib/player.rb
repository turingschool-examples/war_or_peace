require './spec/card_spec.rb'

class Player
  attr_reader :name, :deck, :spoils_of_war, :cards

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    (@deck.cards.count) == 0 #this is where i stopped
  end
end
