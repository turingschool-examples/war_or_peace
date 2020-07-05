require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_deck_exists
    # skip
    cards = []
    card_one = Card.new(:heart, "Jack", 11)
    card_two = Card.new(:diamond, "Queen", 12)
    card_three = Card.new(:spade, "King", 13)

    cards << card_one
    cards << card_two
    cards << card_three
    deck = Deck.new(cards)
    assert_instance_of(Deck, deck)
  end

  def test_rank_of_card_at
    # skip
    cards = []
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:diamond, "two", 2)
    card3 = Card.new(:spade, "three", 3)

    cards << card1
    cards << card2
    cards << card3
    deck = Deck.new(cards)
    assert_equal 11, deck.rank_of_card_at(0)
    assert_equal 2, deck.rank_of_card_at(1)
    assert_equal 3, deck.rank_of_card_at(2)

  end

  def test_it_can_add_card
    # skip

    card1 = Card.new(:diamond, "ten", 10)
    card2 = Card.new(:spade, "ten", 10)
    card3 = Card.new(:heart, "ten", 10)
    card4 = Card.new(:club, "ten", 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.add_card(card4)
    assert_equal [card1, card2, card3, card4], deck.cards

  end

  def test_it_can_remove_card
    card1 = Card.new(:diamond, "ten", 10)
    card2 = Card.new(:spade, "ten", 10)
    card3 = Card.new(:heart, "ten", 10)
    card4 = Card.new(:club, "ten", 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 3, deck.cards.length
    assert_equal card1, deck.remove_card
    assert_equal 2, deck.cards.length

  end

  def test_it_can_find_high_ranking_cards
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:diamond, "two", 2)
    card3 = Card.new(:spade, "three", 3)
    card4 = Card.new(:club, "king", 13)
    cards = [card1, card2, card3, card4]
    deck = Deck.new(cards)

    assert_equal [card1, card4], deck.high_ranking_cards
  end

  def test_it_can_determine_percent_high_ranking
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking

    deck.remove_card
    assert_equal 50, deck.percent_high_ranking

    deck.add_card(card4)
    assert_equal [card2, card3, card4], deck.cards
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 33.34, deck.percent_high_ranking

  end

end
