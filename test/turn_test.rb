require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test

  def test_players_exsist

    card1 = Card.new(:spae, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    cards = [card1, card2]
    card1 = Card.new(:spae, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    cards2 = [card1, card2]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    players = Turn.new(player1, player2)

    assert_instance_of Turn, players
  end

  def test_turn_type_basic

    card1 = Card.new(:spae, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    cards = [card1, card2]
    card1 = Card.new(:spae, 'Jack', 10)
    card2 = Card.new(:club, '9', 9)
    cards2 = [card1, card2]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    assert_equal :basic, turn.type
  end

  def test_turn_type_war

    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'Jack', 10)
    card3 = Card.new(:club, '9', 9)
    cards = [card1, card2, card3]
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card3 = Card.new(:spade, '6', 6)
    cards2 = [card1, card2, card3]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)


    assert_equal :war, turn.type
  end

  def test_turn_type_mad
    
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card3 = Card.new(:heart, 'Jack', 10)
    card4 = Card.new(:spade, 'Jack', 10)
    cards = [card1, card2, card3]
    card4 = Card.new(:spade, 'Queen', 11)
    card5 = Card.new(:club, 'King', 12)
    card6 = Card.new(:heart, 'Jack', 10)
    card7 = Card.new(:dimond, 'Jack', 10)
    cards2 = [card4, card5, card6]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2


    assert_equal :mutually_assured_destruction, turn.type
  end


end
