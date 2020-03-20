require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'


class DeckTest < Minitest::Test

  def test_deck_exists

      card1 = Card.new(:spae, 'Queen', 11)
      card2 = Card.new(:club, 'King', 12)
      cards = [card1, card2]

      deck = Deck.new(cards)

      assert_instance_of Deck, deck
    end

    def test_it_has_high_ranking_cards

      card1 = Card.new(:spae, 'Queen', 11)
      card2 = Card.new(:club, '3', 3)
      cards = [card1, card2]

      deck = Deck.new(cards)

      assert_equal [card1], deck.high_ranking_cards
    end

    def test_it_calclautes_high_ranking_card_percentage

      card1 = Card.new(:spade, 'Queen', 11)
      card2 = Card.new(:club, '3', 3)
      card3 = Card.new(:heart, '2', 2)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      assert_equal 33.33, deck.percent_high_ranking

    end

    def test_it_removes_cards

      card1 = Card.new(:spade, 'Queen', 11)
      card2 = Card.new(:club, '3', 3)
      card3 = Card.new(:heart, '2', 2)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      assert_equal card1, deck.remove_card
    end

    def test_it_adds_cards
      card1 = Card.new(:spade, 'Queen', 11)
      card2 = Card.new(:club, '3', 3)
      card3 = Card.new(:heart, '2', 2)
      card4 = Card.new(:heart, '3', 3)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      assert_equal [card1, card2, card3, card4], deck.add_card(card4)
    end

  end
