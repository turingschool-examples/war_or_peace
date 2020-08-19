require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test
  def test_it_exists
    cards = []
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_can_take_in_a_single_card
    # skip
    cards = []
    card = Card.new(:diamond, 'Queen', 12)
    cards << card
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_take_in_a_different_single_card
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_take_in_an_even_more_unique_single_card
    # skip
    cards = []
    card = Card.new(:spade, '3', 3)
    cards << card
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_take_in_multiple_cards
    # skip
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_it_can_find_the_rank_of_a_particular_card
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:club, '7', 7)
    deck = Deck.new(cards)

    deck.rank_of_card_at(0)
    
    assert_equal 12, deck.cards.rank_of_card_at(0)
  end

  def test_it_can_find_all_the_high_ranking_cards
    cards = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards << card3
    card4 = Card.new(:diamond, '9', 9)
    deck = Deck.new(cards)
  end

  def test_it_can_find_the_percentage_of_high_ranking_cards_in_the_deck
  end

  def test_it_can_remove_a_card_from_the_deck
  end

  def test_it_can_add_a_card_to_the_deck
  end


end

# pry(main)> deck.rank_of_card_at(0)
# #=> 12
#
# pry(main)> deck.rank_of_card_at(2)
# #=> 14
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 66.67
#
# pry(main)> deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 50.0
#
# pry(main)> card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">
#
# pry(main)> deck.add_card(card4)
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 33.33
