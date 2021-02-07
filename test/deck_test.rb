require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
  end

  def test_it_exists
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)

    assert_equal 3, deck.cards.length
  end

  def test_it_can_return_rank_at_index_pos
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)

    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_it_can_return_rank_at_another_index_pos
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)

    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_returns_high_ranking_cards
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)

    assert_equal [@card1, @card3], deck.high_ranking_cards
  end

  def test_it_returns_percentage_of_high_ranking_cards
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_top_card
    # skip
    @card1
    @card2
    @card3
    deck = Deck.new(@card1, @card2, @card3)
    deck.remove_card
    assert_equal 2, deck.cards.length
  end

  def test_it_can_add_one_card_to_bottom
    # skip
    @card1
    @card2
    @card3
    card4 = Card.new(:club, "5", 5)
    deck = Deck.new(@card1, @card2, @card3)
    deck.remove_card
    deck.add_card(card4)

    assert_equal 3, deck.cards.length
  end

  def test_rankofcard_method_does_not_return_nil
    card1 = Card.new(:diamond, "Jack", 11)
    card2 = Card.new(:club, "8", 8)
    deck = Deck.new(card1, card2)
    refute_nil deck.rank_of_card_at(2)
  end
end
