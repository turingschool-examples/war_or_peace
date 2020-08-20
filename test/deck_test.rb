require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'



class DeckTest <Minitest::Test

  attr_reader :card1, :card2, :card3, :cards, :deck

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
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

  def remove_card
    cardremoved = [card2, card3]
    expected = deck.remove_card
    assert_equal cardremoved, expected
  end

end
