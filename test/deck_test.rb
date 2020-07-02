require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest :: Tes

  def test_it_exists
    deck = Deck.new([])
    assert_instance_of Deck, deck
  end

def test_it_has_cards
  card_1 = Card.new(:heart, "Jack", 11)
  card_1 = Card.new(:diamond, "6", 6)
  card_1 = Card.new(:heart, "Queen", 12)

  deck = Deck.new([card_1, card_2, card_3])

  assert_equal [card_1, card_2, card_3], deck.cards
end


  def test_it_has_rank_of_cards_at
    deck = Deck.new[index]
    assert_equal 1, deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    deck = Deck.new
    assert_equal Jack, deck.high_ranking_cards
  end

   def test_percent_of_high_ranking
    card1 = Card.new(:heart, "2", 2)
    card2 = Card.new(:spade, "Ace", 14)
    card3 = Card.new(:heart, "King", 13)
   assert_equal 66.67, deck.percent_of_high_ranking
  end

  def card_can_be_removed
    deck = Deck.new
    assert_equal (@cards - 1), @cards.shift
  end

  def card_can_be_added
    deck = Deck.new
    assert_equal (@cards + 1), @cards.push
  end
