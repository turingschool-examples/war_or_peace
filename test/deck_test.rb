require './test/test_helper'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new(:Heart, "Jack", 11)
    deck = Deck.new(card_1)

    assert_instance_of Deck, deck
  end

  def test_cards_is_an_array
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    cards = [card_1, card_1]
    deck = Deck.new(cards)

    assert_equal 2, deck.cards.length
  end

  def test_card_rank_at_index
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    assert_equal 13, deck.rank_of_card_at(3)
  end

  def test_returns_array_of_high_rank_cards
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamon, "10", 10)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal [card_1, card_2], deck.high_ranking_cards
  end

  def test_can_calculate_percent_high_ranking
    card_1 = Card.new(:Heart, "10", 10)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_4, card_4]
    deck = Deck.new(cards)

    assert_equal 75.0, deck.percent_high_ranking
  end

  def test_can_remove_card
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    deck.remove_card

    assert_equal [card_2, card_3, card_4], deck.cards
  end

  def test_can_add_card
    card_1 = Card.new(:Heart, "Jack", 11)
    card_2 = Card.new(:Spade, "Jack", 11)
    card_3 = Card.new(:Diamond, "Queen", 12)
    card_4 = Card.new(:Club, "King", 13)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)
    card_5 = Card.new(:Diamond, "3", 3)
    deck.add_card(card_5)

    assert_equal [card_1, card_2, card_3, card_4, card_5], deck.cards
  end

end
