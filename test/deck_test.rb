require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require "pry"

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new([card1])

    assert_instance_of Deck, deck
  end

  def test_it_can_detect_rank
    card1 = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new([card1])

     assert_equal 12, card1.rank
   end

   def test_can_find_rank_based_on_index
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)

     assert_equal 14, deck.rank_of_card_at(2)
   end

   def test_can_find_another_rank_based_on_index
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)

     assert_equal 3, deck.rank_of_card_at(1)
   end

   def test_array_of_high_cards
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)
     deck.high_ranking_cards
     #binding.pry
     assert_equal [card1, card3], deck.high_cards
   end


   def test_percent_high_cards
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        deck.high_ranking_cards

        assert_equal 66.67, deck.percent_high_ranking
    end

    def test_remove_card
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      assert_equal card1, deck.remove_card
    end

    def test_high_cards_accurate_after_remove
      skip
    end


    def test_add_card
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)

      assert_equal [card1, card2, card3, card4], deck.add_card(card4)
    end


end
