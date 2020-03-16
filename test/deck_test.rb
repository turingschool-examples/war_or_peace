equire 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)
  end


end
