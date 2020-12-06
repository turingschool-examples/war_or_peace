require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    cards = []
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_holds_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_return_the_rank_of_card_at
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1.rank, deck.rank_of_card_at(0)
    assert_equal card3.rank, deck.rank_of_card_at(2)
  end

  def test_it_can_retun_high_rank_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_includes(deck.high_rank_cards, card1)
    refute_includes(deck.high_rank_cards, card2)
    assert_includes(deck.high_rank_cards, card3)
  end

  def test_it_can_return_percent_of_high_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_the_first_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    refute_includes(deck.cards, card1)
    assert_includes(deck.cards, card2)
    assert_includes(deck.cards, card3)
  end

  def test_it_can_add_a_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2]
    deck = Deck.new(cards)
    deck.add_card(card3)

    assert_includes(deck.cards, card1)
    assert_includes(deck.cards, card2)
    assert_equal card3, deck.cards.last
  end

end
