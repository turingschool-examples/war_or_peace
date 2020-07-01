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

     cards << card4
     assert_includes cards, card4
   end

   def test_card_can_be_removed
     skip
   end

   def test_returns_rank_of_card_at_specified_index
     skip
   end

   def test_returns_all_high_ranking_cards_in_deck
     skip
   end

   def test_returns_percent_of_high_ranking_cards
     skip
   end
end
