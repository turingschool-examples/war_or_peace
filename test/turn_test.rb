require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_two_players
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_it_starts_with_no_spoils_of_war
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_can_identify_turn_type_when_basic
    assert_equal :basic, @turn.type
  end

  # test identifying other turn types

  def test_it_can_identify_a_turn_winner_when_basic
    assert_equal @player1, @turn.winner
  end

  # test identifying winners with other turn types

  def test_pile_cards_method_sends_top_card_from_each_players_deck_to_spoils_of_war
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  # test pile_cards for other turn types

  def test_it_awards_spoils_of_war_to_winner_of_bsaic_turn
    require "pry"; binding.pry
    @turn.pile_cards
    winner = @turn.winner
    @turn.award_spoils(winner)

    assert_equal [@card2, @card5, @card8, @card1, @card3], @player1.deck
    assert_equal [@card4, @card6, @card7], @player2.deck
    # assuming cards that went into spoils of war pile should automatically be removed from players' decks
    assert_equal [], @turn.spoils_of_war
  end
end
