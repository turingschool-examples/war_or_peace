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

  def test_number_of_cards_to_spoils
    card1 = Card.new(:club, '2', 2)
    cards0 = []
    cards1 = [card1]
    cards2 = [card1, card1]
    cards3 = [card1, card1, card1]
    cards4 = [card1, card1, card1, card1]
    deck0 = Deck.new(cards0)
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    deck3 = Deck.new(cards3)
    deck4 = Deck.new(cards4)
    player0 = Player.new('zero', deck0)
    player1 = Player.new('one', deck1)
    player2 = Player.new('two', deck2)
    player3 = Player.new('three', deck3)
    player4 = Player.new('four', deck4)
    turn01 = Turn.new(player0, player1)
    turn23 = Turn.new(player2, player3)
    turn44 = Turn.new(player4, player4)

    assert_equal 0, turn01.cards_to_spoils(player0)
    assert_equal 1, turn01.cards_to_spoils(player1)
    assert_equal 2, turn23.cards_to_spoils(player2)
    assert_equal 3, turn23.cards_to_spoils(player3)
    assert_equal 3, turn44.cards_to_spoils(player4)

  end

  def test_player_has_less_than_3_cards
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:club, '3', 3)
    card3 = Card.new(:club, '4', 4)
    cards1 = [card1, card2]
    cards2 = [card1, card2, card3]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)

    assert_equal false, turn.three_cards?(player1)
    assert_equal true, turn.three_cards?(player2)

  end

  def test_if_first_cards_are_equal
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1]
    cards2 = [card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck1)
    player3 = Player.new('Tuna', deck2)
    turn = Turn.new(player1, player2)
    turn2 = Turn.new(player1, player3)

    assert_equal true, turn.first_cards_equal?
    assert_equal false, turn2.first_cards_equal?

  end

  def test_if_second_cards_are_equal_with_3_plus
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1, card1, card1]
    cards2 = [card2, card2, card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck1)
    player3 = Player.new('Tuna', deck2)
    turn1 = Turn.new(player1, player2)
    turn2 = Turn.new(player1, player3)
    #binding.pry
    assert_equal true, turn1.third_cards_equal?
    assert_equal false, turn2.third_cards_equal?

  end

  def test_if_second_cards_are_equal_with_2_minus
    card1 = Card.new(:club, '2', 2)
    cards1 = [card1, card1]
    deck1 = Deck.new(cards1)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck1)
    turn1 = Turn.new(player1, player2)
    #binding.pry
    assert_equal false, turn1.third_cards_equal?
  end

  def test_type_identifies_basic
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1]
    cards2 = [card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal :basic, turn1.type

  end

  def test_type_identifies_mutually_assured_destruction
    card1 = Card.new(:club, '2', 2)
    cards1 = [card1, card1, card1]
    deck1 = Deck.new(cards1)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck1)
    turn1 = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn1.type
  end

  def test_type_identifies_war
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1, card1, card1]
    cards2 = [card1, card2, card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal :war, turn1.type
  end

  def test_winner_chooses_player_with_higher_card_at_0_when_basic
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1, card1, card1]
    cards2 = [card2, card2, card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal :basic, turn1.type
    #binding.pry
    assert_equal turn1.player2, turn1.winner
  end

  def test_winner_chooses_player_with_higher_card_at_2_when_war
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    cards1 = [card1, card1, card1]
    cards2 = [card1, card2, card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal :war, turn1.type
    assert_equal turn1.player2, turn1.winner

  end

  def test_winner_choose_NO_WINNER_if_mutually_assured_destruction
    card1 = Card.new(:club, '2', 2)
    cards1 = [card1, card1, card1]
    cards2 = [card1, card1, card1]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn1.type
    assert_equal "No Winner", turn1.winner
  end

  def test_pile_cards_adds_to_spoils_and_removes_from_players_basic
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:club, '5', 5)
    cards1 = [card1, card3, card2]
    cards2 = [card2, card3, card1]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)
    turn1.type
    turn1.pile_cards
    #binding.pry

    assert_equal [card1, card2], turn1.spoils_of_war
    assert_equal [card3, card2], turn1.player1.deck.cards
    assert_equal [card3, card1], turn1.player2.deck.cards
  end

  def test_pile_cards_adds_to_spoils_and_removes_from_players_war
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:club, '3', 3)
    card3 = Card.new(:club, '4', 4)
    card4 = Card.new(:spade, '2', 2)
    card5 = Card.new(:spade, '3', 3)
    card6 = Card.new(:spade, '5', 5)
    cards1 = [card1, card2, card3, card3]
    cards2 = [card4, card5, card6, card6]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn1 = Turn.new(player1, player2)
    turn1.type
    turn1.pile_cards

    assert_equal [card1, card2, card3, card4, card5, card6], turn1.spoils_of_war
    assert_equal [card3], turn1.player1.deck.cards
    assert_equal [card6], turn1.player2.deck.cards
  end


end#final
