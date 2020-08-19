require './test/test_helper'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, "3", 3)
    @card3 = Card.new(:heart, "Ace", 14)
    @card4 = Card.new(:club, "9", 9)
    @cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@cards)
  end

  def test_deck_class_exists
    assert_instance_of Deck, @deck
  end

  def test_can_access_cards
    assert_equal @cards, @deck.cards
  end

  def test_can_get_rank_of_card_at_index
    assert_equal 14, @deck.rank_of_card_at(2)
    assert_equal 3, @deck.rank_of_card_at(1)
    assert_equal 12, @deck.rank_of_card_at(0)
  end

  def test_can_select_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_can_find_percent_of_cards_that_are_high_ranking
    assert_equal 50.0, @deck.percent_high_ranking
  end

  def test_can_remove_card_from_deck
    @deck.remove_card
    assert_equal [@card2, @card3, @card4], @deck.cards
  end

  def test_can_add_card_to_deck
    card5 = Card.new(:spade, "Ace", 14)
    @deck.add_card(card5)
    assert_equal [@card1, @card2, @card3, @card4, card5], @deck.cards
  end

end
