require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new(:spades, 'Ace', 13)
    cards = [card_1]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  # cards: an attr_reader to read the @cards attribute
  # attribute that this test is going to test, is the attribute of a
  # deck which is an array.
  def test_it_has_readable_attributes
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal deck.cards, cards
  end

  def test_rank_of_card_at
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)
    card_rank = deck.rank_of_card_at(0)

    assert_equal deck.rank_of_card_at(0), 12
    assert_equal deck.rank_of_card_at(2), 14
  end

  def test_high_ranking_cards
    high_ranking_cards = []
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)
    high_ranking_cards = deck.high_ranking_cards

    assert_equal deck.high_ranking_cards, cards = [card1, card3]
  end

  def test_percent_high_ranking_cards
    high_ranking_cards = []
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)
    high_ranking_cards = deck.high_ranking_cards
    deck.percent_high_ranking

    assert_equal deck.percent_high_ranking, 66.67
  end

end
#
#   deck.cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
#   deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]
#
#   deck.percent_high_ranking
# #=> 66.67
#
#   deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">
#
#   deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
#   deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
#   deck.percent_high_ranking
# #=> 50.0
#
#   card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">
#
#   deck.add_card(card4)
#
#   deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]
#
#   deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
#   deck.percent_high_ranking
# #=> 33.33
