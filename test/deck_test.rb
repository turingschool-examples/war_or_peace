require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_it_exists
    deck = Deck.new()

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_card_attribute
    deck = Deck.new()

    assert_equal [], deck.cards
  end

  def test_rank_of_card
    card = Card.new(:diamond, 'Queen', 12)
    cards = [card]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
  end

end
