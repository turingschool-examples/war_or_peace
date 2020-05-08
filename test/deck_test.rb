require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test

#INSTANCES (Figure out where they go)
# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)
# card3 = Card.new(:heart, 'Ace', 14)
# cards = [card1, card2, card3]

#initialize: this method will take one argument - an array of cards.
  def test_it_exists
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

#cards: an attr_reader to read the @cards attribute

  def test_it_has_cards
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
  end

    #rank_of_card_at: this method will take one argument that represents the index location of a card to be used (typically 0 or 2 more on this later 😉 ) and will return the rank of that card
  def test_it_can_rank_card_at
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end
#high_ranking_cards: this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)
  def test_it_can_find_ranks_of_11_or_higher
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end
#percent_high_ranking: this method will return the percentage of cards that are high ranking

  def test_it_return_the_percentage_of_cards_that_are_high_ranking
# skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end
#remove_card: this method will remove the top card from the deck
  def test_it_can_remove_top_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card
    assert_equal [card2, card3], deck.cards
  end

#add_card: this method will add one card to the bottom (end) of the deck
  def test_it_can_add_one_card
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card2, card3]
    deck = Deck.new(cards)

    assert_equal [card2, card3, card4], deck.add_card(card4)
  end
end
