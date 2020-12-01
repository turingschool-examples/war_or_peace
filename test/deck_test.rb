require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeskTest < MiniTest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
  end

  def test_it_exists
    deck = setup

    assert_instance_of Deck, deck
  end

  def test_add_card
    deck = setup
    card4 = Card.new(:club, '5',5)

    assert_equal deck.cards, @cards

    deck.add_card(card4)
    @cards =[@card1, @card2, @card3, card4]

    assert_equal deck.cards, @cards
  end

  def test_high_ranking_cards
    deck = setup

    assert_equal deck.high_ranking_cards, [@card1, @card3]
  end

  def test_percent_high_ranking
    deck = setup

    assert_equal deck.percent_high_ranking, 66.67
  end

  def test_rank_of_card_at
    deck = setup

    assert_equal deck.rank_of_card_at(0), 12
    assert_equal deck.rank_of_card_at(2), 14
  end

  def test_remove_card
    deck = setup
    deck.remove_card
    assert_equal deck.cards, [@card2, @card3]
  end
end
