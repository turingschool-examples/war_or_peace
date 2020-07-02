require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  #
  # def test_it_exists
  #   deck = Deck.new
  #
  #   assert_instance_of Deck, deck
  # end

  # def test_it_has_attributes
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #
  #   cards = [card1, card2, card3]
  #
  #   deck = Deck.new(cards)
  #
  #   assert_equal [card1, card2, card3], deck.cards
  # end

  # def test_cards_have_rank
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #
  #   cards = [card1, card2, card3]
  #
  #   deck = Deck.new(cards)
  #
  #   assert_equal 12, deck.rank_of_card_at(0)
  # end
  #

  def test_percentage_of_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking_cards
    require "pry"; binding.pry
  end



end
