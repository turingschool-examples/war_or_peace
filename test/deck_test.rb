require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'

class DeckTest < Minitest::Test

def test_it_exists
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [@card1, @card2, @card3]
  deck = Deck.new(@cards)

  assert_instance_of Deck, deck
end

def test_it_has_cards
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [@card1, @card2, @card3]
  deck = Deck.new(@cards)

  assert_equal [@card1, @card2, @card3], deck.cards
end

def test_it_can_find_rank
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [@card1, @card2, @card3]
  deck = Deck.new(@cards)

  assert_equal 12, deck.rank_of_card_at(0)
  assert_equal 14, deck.rank_of_card_at(2)
end

end
