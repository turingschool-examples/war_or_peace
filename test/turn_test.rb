require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Jack', 11)
    @card3 = Card.new(:club, '4', 4)
    @card4 = Card.new(:heart, 'King', 13)

    @cards1 =[@card1, @card2, @card3]
    @cards2 = [@card3, @card4, @card2]

    @deck1_basic = Deck.new(@cards1)
    @deck2_basic = Deck.new(@cards2)

    @player1_basic = Player.new("Taylor", @deck1_basic)
    @player2_basic = Player.new("Gus", @deck2_basic)

    @turn_basic = Turn.new(@player1_basic, @player2_basic)

    @deck1_war = Deck.new([@card1, @card2, @card3])
    @deck2_war = Deck.new([@card1, @card2, @card4])
    @player1_war = Player.new("Taylor", @deck1_war)
    @player2_war = Player.new("Gus", @deck2_war)
    @turn_war = Turn.new(@player1_war, @player2_war)

    @player1_mutually_assured_destruction = Player.new("Taylor", @deck1_basic)
    @player2_mutually_assured_destruction = Player.new("Gus", @deck1_basic)
    @turn_mutually_assured_destruction = Turn.new(@player1_mutually_assured_destruction, @player2_mutually_assured_destruction)

  end

  def test_it_exists
    assert_instance_of Turn, @turn_basic
  end

  def test_has_two_players
    assert_equal @turn_basic.player1, @player1_basic
    assert_equal @turn_basic.player2, @player2_basic
  end

  def test_spoils_of_war_is_empty_by_default
    assert_equal @turn_basic.spoils_of_war, []
  end

  def test_type_basic
    assert_equal :basic, @turn_basic.type
  end

  def test_type_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn_mutually_assured_destruction.type
  end

  def test_type_war
    assert_equal :war, @turn_war.type
  end

  def test_winner_basic
    assert_equal :basic, @turn_basic.type
    assert_equal @player1_basic, @turn_basic.winner
  end

  def test_winner_war
    assert_equal :war, @turn_war.type
    assert_equal @player2_war, @turn_war.winner
  end

  def test_winner_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn_mutually_assured_destruction.type
    assert_equal "No Winner", @turn_mutually_assured_destruction.winner
  end

  def test_pile_cards_basic
    assert_equal [], @turn_basic.spoils_of_war

    @turn_basic.pile_cards

    # Make more robust by changing the 2 to a variable
    assert_equal true, @turn_basic.spoils_of_war.length == 2
    assert_equal true, @turn_basic.spoils_of_war.include?(@card1)
    assert_equal true, @turn_basic.spoils_of_war.include?(@card3)
  end

  def test_pile_cards_war
    assert_equal [], @turn_war.spoils_of_war

    @turn_war.pile_cards

    # Make more robust by changing the 6 to a variable
    assert_equal true, @turn_war.spoils_of_war.length == 6
    assert_equal true, @turn_war.spoils_of_war.include?(@card4)
    assert_equal true, @turn_war.spoils_of_war.include?(@card3)
  end

  def test_pile_cards_mutually_assured_destruction
    assert_equal [], @turn_mutually_assured_destruction.spoils_of_war

    @turn_mutually_assured_destruction.pile_cards

    assert_equal [], @turn_mutually_assured_destruction.spoils_of_war
    assert_equal [], @player1_mutually_assured_destruction.deck.cards
    assert_equal [], @player2_mutually_assured_destruction.deck.cards
  end

  def test_award_spoils_basic
    assert_equal [], @turn_basic.spoils_of_war

    cards_before_turn_player1 = @player1_basic.deck.cards
    cards_before_turn_player2 = @player2_basic.deck.cards
    cards_after_awards_spoils_player_2 = cards_before_turn_player2.drop(1)

    winner = @turn_basic.winner
    @turn_basic.pile_cards
    @turn_basic.award_spoils(winner)

    assert_equal (cards_before_turn_player1 << cards_before_turn_player2[0]), @player1_basic.deck.cards
    assert_equal (cards_after_awards_spoils_player_2), @player2_basic.deck.cards
  end

  def test_award_spoils_war
    assert_equal [], @turn_war.spoils_of_war

    cards_before_turn_player1 = @player1_war.deck.cards
    cards_before_turn_player2 = @player2_war.deck.cards
    cards_after_awards_spoils_player_1 = cards_before_turn_player1.drop(3)

    winner = @turn_war.winner
    @turn_war.pile_cards
    @turn_war.award_spoils(winner)

    assert_equal (cards_before_turn_player2 << cards_before_turn_player1[0..2]).flatten!, @player2_war.deck.cards
    assert_equal (cards_after_awards_spoils_player_1), @player1_war.deck.cards
  end


end
