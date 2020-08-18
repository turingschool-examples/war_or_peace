require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    deck = Deck.new[cards]
  end

  def test_it_exists
    deck = Deck.new[cards]

    assert_instance_of Deck, deck
  end

  def test_rank_of_card_at
    deck = Deck.new([cards])

    assert_equal 0, deck.rank_of_card_at(0)
  end

  def high_ranking_cards
    ranks = [11, 12, 13]
    ranks.find_all do |rank|
      rank.count >= 11
  end

  def test_remove_card
    deck = Deck.new[cards]

    assert deck.remove_card
  end

  def test_add_card
    deck = Deck.new[cards]

    assert deck.add_card
  end

end

p high_ranking_cards
