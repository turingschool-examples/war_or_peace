require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test

  def test_players_exsist
    skip
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
    skip
    card1 = Card.new(:spae, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card3 = Card.new(:heard, '4', 4)
    cards = [card1, card2, card3]
    card1 = Card.new(:spae, 'Jack', 10)
    card2 = Card.new(:club, '9', 9)
    card3 = Card.new(:spade, '5', 5)
    cards2 = [card1, card2, card3]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    # turn.player1
    # turn.player2


    assert_equal :basic, turn.type
  end

  def test_turn_type_war
    skip
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
    skip
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
    # turn.player1
    # turn.player2


    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_for_winner_basic
    skip
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '3', 3)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Queen', 10)
    card5 = Card.new(:club, 'King', 12)
    card7 = Card.new(:heart, '5', 5)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal player1, turn.winner
  end

  def test_for_winner_war
    skip
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '3', 3)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Queen', 11)
    card5 = Card.new(:club, 'King', 14)
    card7 = Card.new(:heart, '5', 5)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal player2, turn.winner
  end

  def test_for_winner_mad
    skip
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '3', 3)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Queen', 11)
    card5 = Card.new(:club, 'King', 14)
    card7 = Card.new(:heart, '3', 3)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal :neither_player, turn.winner
  end

  def test_pile_cards_basic_turn
    
    card1 = Card.new(:spade, 'Queen', 10)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '3', 3)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Queen', 11)
    card5 = Card.new(:club, 'King', 14)
    card7 = Card.new(:heart, '3', 3)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal [card1, card4], turn.pile_cards
  end

  def test_pile_cards_war_turn
    skip
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '3', 3)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Queen', 11)
    card5 = Card.new(:club, 'King', 14)
    card7 = Card.new(:heart, '4', 4)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal [card1, card2, card6, card4, card5, card7], turn.pile_cards
  end

  def test_pile_cards_mad_turn
    skip
    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '4', 4)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Queen', 11)
    card5 = Card.new(:club, 'King', 14)
    card7 = Card.new(:heart, '4', 4)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal [], turn.pile_cards
  end

  def test_award_spoils

    card1 = Card.new(:spade, 'Queen', 11)
    card2 = Card.new(:club, 'King', 12)
    card6 = Card.new(:club, '4', 4)
    cards = [card1, card2, card6]
    card4 = Card.new(:spade, 'Jack', 10)
    card5 = Card.new(:club, 'King', 14)
    card7 = Card.new(:heart, '4', 4)
    cards2 = [card4, card5, card7]
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards2)

    player1 = Player.new("Jack", deck1)
    player2 = Player.new("John", deck2)

    turn = Turn.new(player1, player2)
    turn.player1
    turn.player2

    turn.type
    winner = turn.winner

    assert_equal [card1, card4, card2, card6], turn.award_spoils
  end

end
