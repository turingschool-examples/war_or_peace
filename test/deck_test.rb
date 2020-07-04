require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
#require 'nyan-cat'


#reqiure = where i am exectuting from
#require_relative = relative to where i have defined the runner file
  #runner file is where all instances of class live

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)


    assert_instance_of Deck, @deck
    #asert_equal 'expected', 'actual'
  end

  def test_has_cards
    # skip
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    assert_equal @cards, @deck.cards
  end

  def test_rank_of_card
    # skip
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card3 = Card.new(:heart, 'Ace', 14)

    assert_equal 12, @card1.rank
    assert_equal 14, @card3.rank
  end



  def test_high_ranking_cards
    #skip
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def percent_high_ranking
    # skip
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
     deck.percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_remove_card
    # skip
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    @deck.remove_card


    assert_equal [@card2, @card3], @deck.cards
  end

  def test_add_card
    #skip
    # @card1 = Card.new(:diamond, 'Queen', 12)
    # @card2 = Card.new(:spade, '3', 3)
    # @card3 = Card.new(:heart, 'Ace', 14)
    # @cards = [@card1, @card2, @card3]
    # @deck = Deck.new(@cards)
    @card4 = Card.new(:club, '5', 5)
     @deck.add_card(@card4)

    assert_equal [@card1, @card2, @card3, @card4], @deck.cards
  end

  def test_all_methods
    # skip
    # card1 = Card.new(:diamond, 'Queen', 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, 'Ace', 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    @deck.high_ranking_cards
    @deck.percent_high_ranking

    assert_equal [@card1, @card3], @deck.high_ranking_cards
    assert_equal 66.67, @deck.percent_high_ranking

     @deck.remove_card
     @deck.high_ranking_cards
     @deck.percent_high_ranking
     assert_equal [@card3], @deck.high_ranking_cards
     assert_equal 50, @deck.percent_high_ranking

     @card4 = Card.new(:club, '5', 5)
     @deck.add_card(@card4)
     assert_equal [@card2, @card3, @card4], @deck.cards

     @deck.high_ranking_cards
     @deck.percent_high_ranking
     assert_equal [@card3], @deck.high_ranking_cards
     assert_equal 33.33, @deck.percent_high_ranking
  end

end
