require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'



class DeckTest <Minitest::Test

  attr_reader :card1, :card2, :card3, :card4
  attr_accessor :deck, :expected, :cards

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
    @expected = []
  end

  def Test_deck_exists
    assert_instance_of Deck, deck
  end

  def test_rank_of_cards
    assert_equal 12, deck.rank_of_card(0)
  end

  def test_high_rank_cards
    highcards = [card1,card3]
    assert_equal highcards, deck.high_ranking_cards
  end

  def test_percent_high_rank
    expected = deck.percent_high_ranking
    assert_in_delta 66.67, expected, 0.01
  end

  def test_remove_card
    cardremoved = [card2, card3]
    expected = deck.remove_card
    highcards = [card3]
    assert_equal cardremoved, expected
    assert_in_delta 50, deck.percent_high_ranking, 0.01
    assert_equal highcards, deck.high_ranking_cards
  end

  def test_add_card
    cardadded = [card2, card3, card4]
    highcards = [card3]
    deck.remove_card
    expected = deck.add_card(card4)
    assert_equal cardadded, expected
    assert_in_delta 33.33, deck.percent_high_ranking, 0.01
    assert_equal highcards, deck.high_ranking_cards
  end

end
