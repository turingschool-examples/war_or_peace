require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require "pry"

class TurnTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, 'Jack', 11)
    card5 = Card.new(:heart, '5', 5)
    card6 = Card.new(:diamond, '7', 7)
    card7 = Card.new(:spade, '10', 10)
    card8 = Card.new(:spade, 'Ace', 14)
    card9 = Card.new(:heart, '2', 2)
    card10 = Card.new(:club, '6', 6)
    cards1 = [card1, card2, card3, card4, card5]
    cards2 = [card6, card7, card8, card9, card10]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_type_identifies_correctly
    card1 = Card.new(:heart, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1]
    cards2 = [card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type

    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:spade, '2', 2)
    card5 = Card.new(:spade, '3', 3)
    card6 = Card.new(:spade, '4', 4)
    cards1 = [card1, card2, card3]
    cards2 = [card4, card5, card6]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type

    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:spade, '2', 2)
    card5 = Card.new(:spade, '3', 3)
    card6 = Card.new(:spade, '10', 10)
    cards1 = [card1, card2, card3]
    cards2 = [card4, card5, card6]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_winner_is_higher_card
      card1 = Card.new(:heart, '5', 5)
      card2 = Card.new(:spade, '3', 3)
      cards1 = [card1]
      cards2 = [card2]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('Shark', deck1)
      player2 = Player.new('Guppie', deck2)
      turn = Turn.new(player1, player2)

      assert_equal turn.player1, turn.winner

      card1 = Card.new(:heart, '2', 2)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:heart, '4', 4)
      card4 = Card.new(:spade, '2', 2)
      card5 = Card.new(:spade, '3', 3)
      card6 = Card.new(:spade, '10', 10)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('Shark', deck1)
      player2 = Player.new('Guppie', deck2)
      turn = Turn.new(player1, player2)

      assert_equal turn.player2, turn.winner

      card1 = Card.new(:heart, '2', 2)
      card2 = Card.new(:heart, '3', 3)
      card3 = Card.new(:heart, '4', 4)
      card4 = Card.new(:spade, '2', 2)
      card5 = Card.new(:spade, '3', 3)
      card6 = Card.new(:spade, '4', 4)
      cards1 = [card1, card2, card3]
      cards2 = [card4, card5, card6]
      deck1 = Deck.new(cards1)
      deck2 = Deck.new(cards2)
      player1 = Player.new('Shark', deck1)
      player2 = Player.new('Guppie', deck2)
      turn = Turn.new(player1, player2)

      assert_equal "No Winner", turn.winner
  end

  def test_pile_cards_adds_to_spoils_and_removes_from_players
    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:heart, '5', 5)
    cards1 = [card1, card2]
    cards2 = [card3, card4]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal [card1, card3], turn.spoils_of_war

    assert_equal [card2], turn.player1.deck.cards
    assert_equal [card4], turn.player2.deck.cards

    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:spade, '2', 2)
    card5 = Card.new(:spade, '3', 3)
    card6 = Card.new(:spade, '5', 5)
    cards1 = [card1, card2, card3]
    cards2 = [card4, card5, card6]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
    spoils = [card1, card2, card3, card4, card5, card6]

    assert_equal spoils, turn.spoils_of_war
    assert_equal [], turn.player1.deck.cards
    assert_equal [], turn.player2.deck.cards

  end

  def test_if_spoils_go_to_winner_when_award_spoils_after_basic

    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:heart, '5', 5)
    # card5 = Card.new(:heart, '6', 6)
    # card6 = Card.new(:heart, '7', 7)
    cards1 = [card1, card2]
    cards2 = [card3, card4]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils

    assert_equal [card4, card1, card3], turn.player2.deck.cards

  end

  def test_if_spoils_go_to_winner_when_award_spoils_after_war

    card1 = Card.new(:heart, '2', 2)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:heart, '4', 4)
    card4 = Card.new(:club, '2', 2)
    card5 = Card.new(:heart, '6', 6)
    card6 = Card.new(:heart, '7', 7)
    cards1 = [card1, card2, card3]
    cards2 = [card4, card5, card6]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils

  #  binding.pry

    assert_equal [card1, card2, card3, card4, card5, card6], turn.player2.deck.cards

  end

  def test_spoils_has_2_after_basic
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, 'Jack', 11)
    card5 = Card.new(:heart, '5', 5)
    card6 = Card.new(:diamond, '7', 7)
    card7 = Card.new(:spade, '10', 10)
    card8 = Card.new(:spade, 'Ace', 14)
    card9 = Card.new(:heart, '2', 2)
    card10 = Card.new(:club, '6', 6)
    cards1 = [card1, card2, card3, card4, card5]
    cards2 = [card6, card7, card8, card9, card10]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards
    turn.spoils_of_war

    assert_equal [card1, card6], turn.spoils_of_war
  end

  def test_spoils_has_6_after_war
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, 'Jack', 11)
    card5 = Card.new(:heart, '5', 5)
    card6 = Card.new(:heart, 'Queen', 12)
    card7 = Card.new(:spade, '10', 10)
    card8 = Card.new(:spade, '8', 8)
    card9 = Card.new(:heart, '2', 2)
    card10 = Card.new(:club, '6', 6)
    cards1 = [card1, card2, card3, card4, card5]
    cards2 = [card6, card7, card8, card9, card10]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)

    turn = Turn.new(player1, player2)

    turn.pile_cards
    turn.spoils_of_war
    expected_spoils = [card1, card2, card3, card6, card7, card8]
    assert_equal expected_spoils, turn.spoils_of_war
  end

end
