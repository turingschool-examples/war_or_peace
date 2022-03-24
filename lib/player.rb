class Player
  require 'rspec'
  require './lib/card'
  require './lib/deck'
  require 'pry'
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if @deck.cards.length <= 0
      true
    else
      false
    end

  end
end
