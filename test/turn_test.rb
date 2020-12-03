require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:heart, '9', 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    @player1 = Player.new('Clarissa', deck1)
    @player2 = Player.new('Tracy', deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_a_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_readable_attributes
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_returns_basic_when_both_players_first_cards_are_different
    assert_equal :basic, @turn.type
  end

  def test_it_returns_war_when_both_players_first_cards_are_the_same
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:club, '10', 10)
    card3 = Card.new(:spade, '4', 4)
    card4 = Card.new(:heart, 'Jack', 11)

    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card1, card2, card4])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_returns_mutually_assured_destruction_when_players_first_and_last_cards_are_the_same
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:club, '10', 10)
    card3 = Card.new(:heart, '4', 4)

    deck = Deck.new([card1, card2, card3])

    player1 = Player.new('Clarissa', deck)
    player2 = Player.new('Tracy', deck)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_returns_the_winner_of_basic_type_who_has_a_higher_rank_of_card_at_0
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:club, '10', 10)

    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card2, card1])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_it_returns_winner_of_war_type_who_has_a_higher_rank_of_card_at_2
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:club, '10', 10)
    card3 = Card.new(:spade, '4', 4)
    card4 = Card.new(:heart, 'Jack', 11)

    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card1, card3, card4])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_it_returns_no_winner_for_mutually_assured_destruction_type
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:club, '10', 10)
    card3 = Card.new(:spade, '4', 4)
    card4 = Card.new(:heart, 'Jack', 11)

    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card1, card4, card3])

    player1 = Player.new('Clarissa', deck1)
    player2 = Player.new('Tracy', deck2)

    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end
end
