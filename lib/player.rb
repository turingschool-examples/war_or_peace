require './lib/deck'
require './lib/card'

class Player
  attr_reader :name, :deck
  attr_accessor :has_lost

  def initialize(name_param, deck_param)
    @name = name_param
    @deck = deck_param
  end

  def has_lost?
    @has_lost = false
    if @deck.cards.empty?
      @has_lost = true
    end
    has_lost
  end



end
