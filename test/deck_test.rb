require 'minitest/autorun'
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

  def test_rank_of_card_at_method
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)
    assert_equal 12, deck.rank_of_card_at(0)
  end


end
