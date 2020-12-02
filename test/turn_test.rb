require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class TurnTest < MiniTest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    @player1 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 10)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 13)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    @player2 = Player.new("Marisa", deck2)
    turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    turn = setup

    assert_instance_of Turn, turn
  end

  def test_award_spoils
  end

  def test_sending_player_cards_to_spoil_of_war
  end

  def test_basic_type_of_turn
    turn = setup
    assert_equal :basic, turn.type
  end

  def test_war_type_of_turn
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    player5 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 12)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 13)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    player6 = Player.new("Marisa", deck2)

    turn = Turn.new(player5,player6)
    assert_equal :war, turn.type
  end

  def test_mutally_assured_destruction_type_of_turn
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    player3 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 12)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 14)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    player4 = Player.new("Marisa", deck2)

    turn = Turn.new(player3,player4)
    assert_equal :mutally_assured_destruction, turn.type
  end

  def test_basic_winner_of_war
    turn = setup
    assert_equal @player1.name, turn.winner
  end

  def test_mutally_assured_destruction_winner
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    player3 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 12)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 14)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    player4 = Player.new("Marisa", deck2)

    turn = Turn.new(player3,player4)
    assert_equal "No Winner", turn.winner
  end
  def test_war_winner
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'King', 13)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    player5 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 12)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'Ace', 14)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    player6 = Player.new("Marisa", deck2)

    turn = Turn.new(player5,player6)
    assert_equal player6.name, turn.winner
  end
end
