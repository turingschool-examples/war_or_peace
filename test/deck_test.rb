
require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"

class DeckTest < Minitest::Test
  def test_it_has_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal false , deck.cards.empty?
    assert_equal 3 , deck.cards.size

  end

  def test_it_has_a_rank_at_index
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 3 , deck.rank_of_card_at(1)
    assert_equal 14 , deck.rank_of_card_at(2)
    assert_equal 12 , deck.rank_of_card_at(0)
  end

  def test_it_has_a_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 2, deck.high_ranking_cards.size
    assert_equal 12, deck.high_ranking_cards[0].rank


  end
  def test_it_has_high_ranking_percentage
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.high_ranking_cards
    assert_equal 66.67, deck.percent_high_ranking

  end

  def test_it_can_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card

    assert_equal 2 , deck.cards.size
    assert_equal 1 , deck.high_ranking_cards.size
    assert_equal 50.0, deck.percent_high_ranking
    assert_equal :spade , deck.cards[0].suit
  end
  def test_it_can_add_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card

    card4 = Card.new(:club, '5', 5)

    deck.add_card(card4)

    assert_equal 3 , deck.cards.size
    assert_equal 1 , deck.high_ranking_cards.size
    assert_equal 33.33, deck.percent_high_ranking
  end
end
