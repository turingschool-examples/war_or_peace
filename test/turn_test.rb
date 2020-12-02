require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require '.lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    skip
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_there_are_two_players
    skip
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_turn_has_spoils_of_war
    skip
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equals [], turn.spoils_of_war
  end

  def test_turns_are_basic
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '9', 9)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type?
  end

  def test_turns_are_war
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type?
  end

  def test_turns_are_mutually_assured_distruction
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '8', 8)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '9', 9)
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_distruction, turn.type?
  end

  def test_there_is_a_winner
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type

    asssert_equal player2, turn.winner
  end

  def test_MAD_turns_have_no_winner
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, 'Queen', 12)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type

    asssert_equal "No Winner", turn.winner
  end

  def test_basic_turn_removes_1_card_from_each_player
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards

    assert_equal [card2, card3, card4], turn.player1.deck.cards
    assert_equal [card6, card7, card8], turn.player2.deck.cards
  end

  def test_war_turn_removes_3_cards_from_each_palyer
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:heart, '8', 8)
    card5 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards

    assert_equal [card4], turn.player1.deck.cards
    assert_equal [card8], turn.player2.deck.cards
  end

  def test_MAD_turn_removes_3_cards_from_each_player
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:heart, '8', 8)
    card5 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:spade, '9', 9)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards

    assert_equal [card4], turn.player1.deck.cards
    assert_equal [card8], turn.player2.deck.cards
  end

  def test_removed_cards_are_moved_to_spoils_of_war
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards

    assert_equal [card2, card3, card4], turn.player1.deck.cards
    assert_equal [card6, card7, card8], turn.player2.deck.cards
    assert_equal [card1, card5], turn.spoils_of_war
  end

  def test_MAD_turns_dont_move_cards_to_spoils_of_war
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:heart, '8', 8)
    card5 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:spade, '9', 9)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards

    assert_equal [card4], turn.player1.deck.cards
    assert_equal [card8], turn.player2.deck.cards
    assert_equal [], turn.spoils_of_war
  end

  def test_spoils_of_war_go_to_the_winner
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards
    turn.award_spoils

    assert_equal [card2, card3, card4, card1, card5], turn.player1.deck.cards
    assert_equal [card6, card7, card8], turn.player2.deck.cards
    assert_equal [], turn.spoils_of_war
  end
end
