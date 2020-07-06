require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

  end

  def test_it_exists
    setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

   def test_card_can_be_added
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, "Ace", 14)
     card4 = Card.new(:club, "2", 2)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)

require "pry"; binding.pry
     assert_equal [card1, card2, card3, card4], deck.add_card(card4)
   end

   def test_card_can_be_removed
     # skip
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, "Ace", 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)


     assert_equal card1, deck.remove_card

   end

   def test_returns_rank_of_card_at_specified_index
     # skip
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, "Ace", 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)


     assert_equal 12, deck.rank_of_card_at(0)
     assert_equal 3, deck.rank_of_card_at(1)
     assert_equal 14, deck.rank_of_card_at(2)
   end

   def test_returns_all_high_ranking_cards_in_deck
     # skip
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, "Ace", 14)
     card4 = Card.new(:club, "2", 2)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)


     assert_equal [card1, card3], deck.high_ranking_cards
   end

   def test_returns_percent_of_high_ranking_cards
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, "Ace", 14)
     card4 = Card.new(:club, "2", 2)
     cards = [card1, card2, card3, card4]
     deck = Deck.new(cards)

     assert_equal 50.0, deck.percent_high_ranking

   end
end
