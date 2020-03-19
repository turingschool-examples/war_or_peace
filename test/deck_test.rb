require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck.rb'
require '../lib/card'


class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new[card1]
    assert_instance_of Deck, deck1
  end

  def test_percent_high_ranking_cards
  skip

  end

  def test_has_high_ranking_cards
  skip
  end

  def test_rank_of_a_card_at_a_given_index
  skip
  end

  def test_add_a_card_to_bottom_of_deck
  skip
  end

  def test_remove_top_card_from_deck
  skip
  end

end
