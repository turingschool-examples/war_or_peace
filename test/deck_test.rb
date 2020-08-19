require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test
  def test_it_exists
    cards = []
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_can_take_in_a_single_card
    # skip
    cards = []
    card = Card.new(:diamond, 'Queen', 12)
    cards << card
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_take_in_a_different_single_card
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_take_in_an_even_more_unique_single_card
    # skip
    cards = []
    card = Card.new(:spade, '3', 3)
    cards << card
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_take_in_multiple_cards
    # skip
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_it_can_find_the_rank_of_a_particular_card
    # skip
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:club, '7', 7)
    deck = Deck.new(cards)

    deck.rank_of_card_at(0)

    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_it_can_find_all_the_high_ranking_cards
    # skip
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:diamond, '9', 9)
    deck = Deck.new(cards)

    deck.high_ranking_cards

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_it_can_find_the_percentage_of_high_ranking_cards_in_the_deck
    # skip
    cards = []
    card1 = Card.new(:diamond, '10', 10)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:club, '7', 7)
    cards << card4
    deck = Deck.new(cards)

    deck.percent_high_ranking

    assert_equal 25.0, deck.percent_high_ranking
  end

  def test_it_can_remove_a_card_from_the_deck
    # skip
    cards = []
    card1 = Card.new(:diamond, '10', 10)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:club, '7', 7)
    cards << card4
    deck = Deck.new(cards)

    deck.remove_card 

    assert_equal [card2, card3, card4], deck.cards
  end

  def test_it_can_add_a_card_to_the_deck
    # skip
    cards = []
    card1 = Card.new(:diamond, '10', 10)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:club, '7', 7)
    cards << card4
    deck = Deck.new(cards)

    deck.percent_high_ranking
    assert_equal 25.0, deck.percent_high_ranking
    card5 = Card.new(:club, 'King', 13)

    deck.add_card(card5)

    assert_equal [card1, card2, card3, card4, card5], deck.cards
  end
end
