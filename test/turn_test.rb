require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require "pry"

class TurnTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.player2
  end

  def test_it_has_basic_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_it_has_basic_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_it_has_war_type
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:clubs, '4', 4)
    card3 = Card.new(:diamond, '5', 5)
    card4 = Card.new(:heart, '10', 10)
    card5 = Card.new(:diamond, '2', 2)
    card6 = Card.new(:heart, '9', 9)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_has_war_winner
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:clubs, '4', 4)
    card3 = Card.new(:diamond, '5', 5)
    card4 = Card.new(:heart, '10', 10)
    card5 = Card.new(:diamond, '2', 2)
    card6 = Card.new(:heart, '9', 9)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_it_has_mutually_assured_destruction_type
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:heart, '9', 9)
    card3 = Card.new(:diamond, '8', 8)
    card4 = Card.new(:heart, '10', 10)
    card5 = Card.new(:diamond, '2', 2)
    card6 = Card.new(:heart, '8', 8)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
    assert_equal 'No Winner', turn.winner
  end

  def test_it_has_no_winner_for_mutually_assured_destruction
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:heart, '9', 9)
    card3 = Card.new(:diamond, '8', 8)
    card4 = Card.new(:heart, '10', 10)
    card5 = Card.new(:diamond, '2', 2)
    card6 = Card.new(:heart, '8', 8)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal 'No Winner', turn.winner
  end

  def test_it_can_pile_cards_basic_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal [card1, card3], turn.spoils_of_war
  end

  def test_it_can_pile_cards_war_type
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:club, '4', 4)
    card3 = Card.new(:diamond, '5', 5)
    card4 = Card.new(:heart, '10', 10)
    card5 = Card.new(:diamond, '2', 2)
    card6 = Card.new(:heart, '9', 9)
    card7 = Card.new(:spade, '4', 4)
    card8 = Card.new(:club, '6', 6)
    deck1 = Deck.new([card1, card2, card3, card7])
    deck2 = Deck.new([card4, card5, card6, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal [card1, card2, card3, card4, card5, card6], turn.spoils_of_war
  end

  def test_it_can_not_pile_cards_mutually_assured_destruction_type
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:heart, '9', 9)
    card3 = Card.new(:diamond, '8', 8)
    card4 = Card.new(:heart, '10', 10)
    card5 = Card.new(:diamond, '2', 2)
    card6 = Card.new(:heart, '8', 8)
    card7 = Card.new(:spade, '4', 4)
    card8 = Card.new(:club, '6', 6)
    deck1 = Deck.new([card1, card2, card3, card7])
    deck2 = Deck.new([card4, card5, card6, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal [card7], player1.deck.cards
    assert_equal [card8], player2.deck.cards
  end

  def test_it_can_award_spoils
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal [card2, card5, card8, card1, card3], player1.deck.cards
    assert_equal [card4, card6, card7], player2.deck.cards
    assert_equal [], turn.spoils_of_war
  end
end
