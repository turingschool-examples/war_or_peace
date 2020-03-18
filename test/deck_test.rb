require 'minitest/autorun'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  # def setup
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   card4 = Card.new(:club, '5', 5)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  # end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_cards_attribute_is_readable
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card3, deck.cards[2]
  end

  def test_it_can_get_rank_of_card_at_index
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards_only_include_high_rank
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_it_can_remove_a_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card

    assert_equal [card2, card3], deck.cards

    deck.remove_card

    assert_equal [card3], deck.cards
  end

  def test_it_adds_card_to_end_of_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2]
    deck = Deck.new(cards)
    deck.add_card(card3)

    assert_equal [card1, card2, card3], deck.cards

    deck.add_card(card4)

    assert_equal [card1, card2, card3, card4], deck.cards
  end

  def test_percent_high_ranking_works
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking

    deck.remove_card

    assert_equal 50.00, deck.percent_high_ranking

    deck.add_card(card4)

    assert_equal 33.33, deck.percent_high_ranking
  end
end
