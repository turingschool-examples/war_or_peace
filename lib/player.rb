# frozen_string_literal: true

class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    deck.cards.length.zero?
  end
end
