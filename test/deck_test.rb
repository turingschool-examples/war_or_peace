require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_setup
    # skip
    card = Card.new(:diamond, 'Queen', 12)
  end

  def test_it_exists_and_has_attributes
    # skip
    # card = Card.new(:diamond, 'Queen', 12)

        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        require "pry"; binding.pry
        # require "pry"; binding.pry

    assert_instance_of Deck, deck
    assert_equal cards, deck.cards
  end

  def test_rank_of_card_at
    skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 12, deck.rank_of_card_at(1)
    assert_equal 12, deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards
    skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    require "pry"; binding.pry

    assert_equal [card1, card3], deck.high_ranking_cards
    refute_equal [card1], deck.high_ranking_cards
  end



end
