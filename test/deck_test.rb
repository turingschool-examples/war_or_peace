require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    #create new cards
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    #add cards to an array
    @cards = [@card1, @card2, @card3]

    #add array of cards to deck
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_initialize
    assert_equal @cards, @deck.cards
  end

  def test_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_percent_high_ranking
    assert_equal 2/3.to_f, @deck.percent_high_ranking
  end

  def test_add_card
    card4 = Card.new(:club, '5', 5)
    assert_equal @cards, @deck.add_card(card4)
  end

  def test_remove_card
    assert_equal [@card2, @card3], @deck.remove_card
  end

end
