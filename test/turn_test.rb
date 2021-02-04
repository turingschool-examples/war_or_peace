require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 =  Card.new(:heart, "Jack", 11)
    @card2 =  Card.new(:heart, "10", 10)
    @card3 =  Card.new(:heart, "9", 9)
    @card4 =  Card.new(:diamond, "Jack", 11)
    @card5 =  Card.new(:heart, "8", 8)
    @card6 =  Card.new(:diamond, "Queen", 12)
    @card7 =  Card.new(:heart, "3", 3)
    @card8 =  Card.new(:diamond, "2", 2)
    @card9 =  Card.new(:spade, "10", 10)
    @card10 = Card.new(:heart, "5", 5)
  end

  def test_it_exists
    @card1
    @card2
    @card3
    @card4
    @card5
    @card6
    @card7
    @card8
    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
# require "pry"; binding.pry
    assert_instance_of Turn, turn
  end

  def test_turn_has_two_players_with_names
    @card1
    @card2
    @card3
    @card4
    @card5
    @card6
    @card7
    @card8
    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal ["Megan", "Aurora"], turn.players_names
  end

  def test_it_has_no_spoils_of_war_by_default
    @card1
    @card2
    @card3
    @card4
    @card5
    @card6
    @card7
    @card8
    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
  end

  def test_it_can_be_basic_turn

    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.turn_type
  end

  def test_it_can_be_war_type
    # skip
    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.turn_type
  end

  def test_it_can_be_mutually_assured_destruction_type
    # skip

    deck1 = Deck.new(@card1, @card5, @card2, @card8, @card10)
    deck2 = Deck.new(@card4, @card3, @card9, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.turn_type
  end

  def test_winner_works_for_basic_turn
    # skip
    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card3, @card4, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_winner_works_for_war_turn
    # skip
    deck1 = Deck.new(@card1, @card2, @card5, @card8)
    deck2 = Deck.new(@card4, @card3, @card6, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_no_winner_works_for_mutually_assured_destruction
    # skip
    deck1 = Deck.new(@card1, @card5, @card2, @card8)
    deck2 = Deck.new(@card4, @card3, @card9, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_basic_play_results_two_new_cards_in_spoils
    # skip
    deck1 = Deck.new(@card1, @card5, @card2, @card8)
    deck2 = Deck.new(@card4, @card3, @card9, @card7)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards

    assert_equal [@card1, @card4], turn.spoils_of_war
  end


end
