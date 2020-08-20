require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Jack', 11)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("Gil", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards2 << card1
    card2 = Card.new(:spade, '3', 3)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:diamond, '10', 10)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Martin", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_there_are_two_players_with_their_own_cards
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    assert_equal cards1, deck1.cards
    assert_equal "August", player1.name
    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    assert_equal cards2, deck2.cards
    assert_equal "Dale", player2.name
  end

  def test_can_have_a_basic_type_of_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'Queen', 12)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_it_can_have_a_war_type_of_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '4', 4)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_can_have_a_mutually_assured_destruction_type_of_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '6', 6)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, '6', 6)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutally_assured_destruction, turn.type
  end

  def test_it_can_have_a_winner_for_a_basic_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'Ace', 14)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner?

    assert_equal "August", turn.winner?.name
  end

  def test_it_can_have_a_winner_for_a_war_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '4', 4)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    turn.winner?

    assert_equal "Dale", turn.winner?.name
  end

  def test_it_can_doesnt_have_a_winner_for_mutually_assured_destruction
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '6', 6)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, '6', 6)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner?

    assert_equal "No Winner", turn.winner?
  end

  def test_it_can_pile_cards_for_a_war_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, '6', 6)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    turn.winner?
    turn.pile_cards

    assert_equal 6, turn.spoils_of_war.length
  end

  def test_it_can_pile_cards_for_a_basic_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'Ace', 14)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner?
    turn.pile_cards

    assert_equal 2, turn.spoils_of_war.length
  end

  def test_it_can_remove_cards_from_each_player_in_mutually_assured_destruction_and_throw_those_away
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '6', 6)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, '6', 6)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner?
    turn.pile_cards

    assert turn.spoils_of_war.empty?
  end

  def test_it_can_award_the_spoils_to_the_winner_of_a_basic_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'Ace', 14)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner?
    turn.pile_cards
    turn.award_spoils(turn.winner)

    assert_includes turn.winner.deck.cards, turn.spoils_of_war
    assert_equal "August", turn.winner.name
  end

  def test_it_can_award_the_spoils_to_the_winner_of_a_war_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, '6', 6)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)

    turn = Turn.new(player1, player2)
    turn.type
    turn.winner?
    # require 'pry';binding.pry
    turn.pile_cards
    turn.award_spoils(turn.winner)

    assert_includes turn.winner.deck.cards, turn.spoils_of_war
    assert_equal "August", turn.winner.name
  end

  def test_it_can_tosses_six_cards_after_a_mutally_assured_destruction_turn
    # skip
    cards1 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards1 << card1
    card2 = Card.new(:spade, '3', 3)
    cards1 << card2
    card3 = Card.new(:heart, '6', 6)
    cards1 << card3
    card4 = Card.new(:diamond, '9', 9)
    cards1 << card4
    deck1 = Deck.new(cards1)
    player1 = Player.new("August", deck1)

    cards2 = []
    card1 = Card.new(:diamond, 'King', 13)
    cards2 << card1
    card2 = Card.new(:spade, '2', 2)
    cards2 << card2
    card3 = Card.new(:heart, '6', 6)
    cards2 << card3
    card4 = Card.new(:club, 'Jack', 11)
    cards2 << card4
    deck2 = Deck.new(cards2)
    player2 = Player.new("Dale", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner?
    turn.pile_cards
    turn.award_spoils(turn.winner)

    assert turn.spoils_of_war.empty?
  end
end
