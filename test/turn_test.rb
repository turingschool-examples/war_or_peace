require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class TurnTest < Minitest::Test
  def test_turn_exists
    turn = Turn.new(player1=nil, player2=nil)

    assert_instance_of Turn, turn
  end

  def test_if_turn_is_basic
    # skip

    card1 = Card.new(:heart,'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1,card2,card5,card8])
    player1 = Player.new('Meagan', deck1)

    deck2 = Deck.new([card3,card4,card6,card7])
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
    assert_equal [], turn.spoils_of_war

    winner = turn.winner

    assert_equal :basic, turn.type
    assert_equal player1, turn.winner

    turn.pile_cards

    assert_equal [card1,card3], turn.spoils_of_war

    turn.award_spoils(winner)
    assert_equal 5, turn.player1.deck.cards.size
    assert_equal 3, turn.player2.deck.cards.size

    assert_equal [card2,card5,card8,card1,card3], turn.player1.deck.cards
    assert_equal [card4,card6,card7], turn.player2.deck.cards
  end

  def test_if_turn_is_war
    # skip

    card1 = Card.new(:heart,'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1,card2,card5,card8])
    player1 = Player.new('Meagan', deck1)

    deck2 = Deck.new([card4,card3,card6,card7])
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)
    assert_equal :war, turn.type

    winner = turn.winner

    assert_equal player2, turn.winner

    turn.pile_cards

    assert_equal [card1,card2,card5,card4,card3,card6], turn.spoils_of_war

    turn.award_spoils(winner)
    assert_equal 1, turn.player1.deck.cards.size
    assert_equal 7, turn.player2.deck.cards.size
    # require "pry"; binding.pry

    assert_equal [card8], turn.player1.deck.cards
    assert_equal [card7,card1,card2,card5,card4,card3,card6], turn.player2.deck.cards
  end

  def test_if_turn_is_mutually_assured_destruction
    # skip

    card1 = Card.new(:heart,'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1,card2,card5,card8])
    player1 = Player.new('Meagan', deck1)

    deck2 = Deck.new([card4,card3,card6,card7])
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type

    victor = turn.winner

    assert_equal "No Winner", turn.winner

    turn.pile_cards

    assert_equal [], turn.spoils_of_war

    turn.award_spoils(victor)
    assert_equal 1, turn.player1.deck.cards.size
    assert_equal 1, turn.player2.deck.cards.size

    assert_equal [card8], turn.player1.deck.cards
    assert_equal [card7], turn.player2.deck.cards
  end

end
