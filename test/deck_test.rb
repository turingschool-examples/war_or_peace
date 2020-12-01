require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < MiniTest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @expected_cards = [@card1, @card2, @card3]
    deck = Deck.new(@expected_cards)
  end

  def test_it_exists
    deck = setup

    assert_instance_of Deck, deck
  end

  def test_add_card_to_deck
    deck = setup
    card4 = Card.new(:club, '5',5)

    assert_equal @expected_cards, deck.cards

    deck.add_card(card4)
    @expected_cards =[@card1, @card2, @card3, card4]

    assert_equal @expected_cards, deck.cards
  end

  def test_high_ranking_cards_in_deck
    deck = setup
    expected_deck = [@card1, @card3]
    assert_equal expected_deck, deck.high_ranking_cards
  end

  def test_percent_high_ranking_cards_in_deck
    deck = setup

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_rank_of_card_at_index
    deck = setup

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_remove_card_from_deck
    deck = setup
    deck.remove_card
    assert_equal [@card2, @card3], deck.cards
  end
end
