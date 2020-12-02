require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'



class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:club, 'Two', 2)
    card3 = Card.new(:spade, 'Ten', 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:club, 'Two', 2)
    card3 = Card.new(:spade, 'Ten', 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_returns_rank
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:club, 'Two', 2)
    card3 = Card.new(:spade, 'Ten', 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 13, deck.rank_of_card_at(0)
  end

  def test_it_returns_other_ranks
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:club, 'Two', 2)
    card3 = Card.new(:spade, 'Ten', 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 10, deck.rank_of_card_at(2)
  end

  def test_it_groups_face_cards
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:club, 'Two', 2)
    card3 = Card.new(:spade, 'Ten', 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert cards[0], deck.high_ranking_cards
  end

  def test_it_returns_high_rank_percentage
    skip
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:club, '2', 2)
    card3 = Card.new(:spade, '10', 10)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 33.3, deck.percent_high_ranking
  end

end
