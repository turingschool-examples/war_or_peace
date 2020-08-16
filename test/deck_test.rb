require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    deck = Deck.new([cards])
  end

  def test_it_exists
    deck = Deck.new([cards])

    assert_instance_of Deck, deck
  end

  def test_rank_of_card_at
    deck = Deck.new([cards])

    assert_equal 0, deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    deck = Deck.new([cards])

    assert_equal = >10, deck.high_ranking_cards
  end

  def test_remove_card
    deck = Deck.new([cards])

    assert_equal 12, deck.remove
  end

  def test_add_card
    deck = Deck.new([cards])

    assert_equal 12, card.add
  end

end
