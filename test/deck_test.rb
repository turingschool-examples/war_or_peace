require './lib/deck'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'


class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_has_attributes

    assert_equal @cards, @deck.cards
  end

  def test_high_ranking_cards
    high_ranking_cards = [@card1, @card3]

    assert_equal high_ranking_cards, @deck.high_ranking_cards
  end

  def test_percent_high_ranking
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:heart, '6', 6)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)

    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_rank_of_card_at

    assert_equal @card1.rank, @deck.rank_of_card_at(0)
  end

  def test_remove_card

    assert_equal @card1, @deck.remove_card
    assert_equal 2, @deck.cards.length
  end

  def test_add_card
    card4 = Card.new(:club, '5', 5)
    new_array = [@card1, @card2, @card3, card4]
    @deck.add_card(card4)
    
    assert_equal new_array, @deck.cards
  end

end
