require './lib/deck'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'

card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new(@cards)

    assert_instance_of Deck, deck
  end


  end






#require 'pry'; binding.pry
