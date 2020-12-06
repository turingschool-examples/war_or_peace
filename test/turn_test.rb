require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'


def build_deck_basic(name)
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart, '9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, 'Queen', 12)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)

  if name == "Megan"
    cards = [card1, card2, card5, card8]
  else
    cards = [card3, card4, card6, card7]
  end
  Deck.new(cards)
end

def build_deck_war(name)
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart,'9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, 'Queen', 12)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)

  if name ==  "Megan"
    cards = [card1, card2, card5, card8]
  else
    cards = [card4, card3, card6, card7]
  end
  Deck.new(cards)
end

def build_deck_mutually(name)
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart, '9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, '8', 8)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)

  if name == "Megan"
    cards = [card1, card2, card5, card8]
  else
    cards = [card4, card3, card6, card7]
  end
  Deck.new(cards)
end


class TurnTest < Minitest::Test

  def setup
    deck1 = build_deck_basic("Megan")
    deck2 = build_deck_basic("Aurora")
    p1 = Player.new('Megan', deck1)
    p2 = Player.new('Aurora', deck2)
    turn = Turn.new(p1, p2)
  end

  def test_it_exists
    deck1 = build_deck_basic("Megan")
    deck2 = build_deck_basic("Aurora")
    p1 = Player.new('Megan', deck1)
    p2 = Player.new('Aurora', deck2)
    turn = Turn.new(p1, p2)
    assert_instance_of Turn, turn
  end

  def test_attr_readers
    deck1 = build_deck_basic("Megan")
    deck2 = build_deck_basic("Aurora")
    p1 = Player.new('Megan', deck1)
    p2 = Player.new('Aurora', deck2)
    turn = Turn.new(p1, p2)

    assert_equal p1, turn.player1
    assert_equal p2, turn.player2
    assert_equal [], turn.spoils_of_war
  end
