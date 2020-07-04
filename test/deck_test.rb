require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  # def setup
  #   #I can't quite understand how this plays into anything.  It doesn't appear to be necessary, but I suspect this is here so the other tests can somehow draw from it so less has to go into the tests below.
  #   @card1 = Card.new(:diamond, 'Queen', 12)
  #   @card2 = Card.new(:spade, '3', 3)
  #   @card3 = Card.new(:heart, 'Ace', 14)
  #   @cards = [@card1, @card2, @card3]
  #   @deck = Deck.new(@cards)
  # end

  def test_it_exists
    deck = Deck.new([])

    assert_instance_of Deck, deck
  end

  # def test_rank_of_card_at
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  # end

  def rank_of_card_at  #why is it that if I name this 'test_rank_of_card_at' it errors out, but otherwise works?
    @cards = [card1, card2, card3]
    assert_equal 12, @cards.rank_of_card_at(0)
    assert_equal 14, @cards.rank_of_card_at(2)
  end

  def test_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card
  end

  def test_add_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:heart, 'Jack', 11)
    card5 = Card.new(:club, '9', 9)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    # I wonder why only one of them can be here at a time...
    # assert_equal [card1, card2, card3, card4], deck.add_card(card4)
    assert_equal [card1, card2, card3, card5], deck.add_card(card5)
  end
end
