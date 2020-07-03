require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require "pry"

class DeckTest < Minitest::Test

    def test_it_exist
        deck = Deck.new
        assert_instance_of Deck, deck
    end

    def test_it_takes_an_array_of_cards
      deck = Deck.new

      deck.cards << card1 = Card.new(:diamond, 'Queen', 12)
      deck.cards << card2 = Card.new(:spade, '3', 3)
      deck.cards << card3 = Card.new(:heart, 'Ace', 14)

# binding.pry
      assert_equal [card1, card2, card3], deck.cards
    end 

    def test_it_returns_the_card_rank_from_the_index
      deck = Deck.new

      deck.cards << card1 = Card.new(:diamond, 'Queen', 12)
      deck.cards << card2 = Card.new(:spade, '3', 3)
      deck.cards << card3 = Card.new(:heart, 'Ace', 14)
# binding.pry
      assert_equal 12, deck.rank_of_card_at(0)
      assert_equal 14, deck.rank_of_card_at(2)
    end

    def test_it_returns_array_of_high_ranking_cards
        deck = Deck.new
  
        deck.cards << card1 = Card.new(:diamond, 'Queen', 12)
        deck.cards << card2 = Card.new(:spade, '3', 3)
        deck.cards << card3 = Card.new(:heart, 'Ace', 14)
# binding.pry
        assert_equal [card1, card2, card3], deck.cards
        assert_equal [card1, card3], deck.high_ranking_cards
      end
    
      def test_it_percentage_of_high_ranking_cards
        deck = Deck.new
  
        deck.cards << card1 = Card.new(:diamond, 'Queen', 12)
        deck.cards << card2 = Card.new(:spade, '3', 3)
        deck.cards << card3 = Card.new(:heart, 'Ace', 14)
# binding.pry
        assert_equal 66.67, deck.percent_high_ranking
      end

      def test_it_can_remove_card
        deck = Deck.new
  
        deck.cards << card1 = Card.new(:diamond, 'Queen', 12)
        deck.cards << card2 = Card.new(:spade, '3', 3)
        deck.cards << card3 = Card.new(:heart, 'Ace', 14)
# binding.pry
        assert_equal card1, deck.remove_card
        assert_equal [card2, card3], deck.cards
        assert_equal [card3], deck.high_ranking_cards
        assert_equal 50.0, deck.percent_high_ranking
      end

      def test_it_can_add_a_card_with_a_method
        deck = Deck.new
  
        deck.cards << card2 = Card.new(:spade, '3', 3)
        deck.cards << card3 = Card.new(:heart, 'Ace', 14)

        assert_equal [card2, card3], deck.cards

        card4 = Card.new(:club, '5', 5)

# binding.pry
        assert_equal [card2, card3, card4], deck.add_card(card4)
        assert_equal [card2, card3, card4], deck.cards
        assert_equal [card3], deck.high_ranking_cards
        assert_equal 33.33, deck.percent_high_ranking
      end
      
end