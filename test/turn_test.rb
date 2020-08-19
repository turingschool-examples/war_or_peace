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
    @card9 = Card.new(:diamond, '8', 8)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @war_deck = Deck.new([@card4, @card3, @card6, @card7])
    @mad_deck = Deck.new([@card4, @card3, @card9, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists_and_has_attributes

    assert_instance_of Turn, @turn
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_can_check_basic_type

    assert_equal :basic, @turn.type
  end

  def test_it_can_get_winner_for_basic

    assert_equal @player1, @turn.winner
  end

  def test_it_can_send_cards_to_spoils_of_war_for_basic

    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_it_can_award_spoils_to_winner
    assert_equal @turn.winner, @turn.award_spoils(@turn.winner)
    assert_equal @deck1, @player1.deck
    assert_equal @deck2, @player2.deck
  end

  def test_it_can_check_war_type
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal :war, @turn.type
  end

  def test_it_can_get_winner_for_war
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player2, @turn.winner
  end

  def test_it_can_send_cards_to_spoils_of_war_for_war
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)

    @turn.pile_cards
    expected = [@card1, @card2, @card5, @card4, @card3, @card6]
    assert_equal expected, @turn.spoils_of_war
    assert_equal @deck1, @player1.deck
    assert_equal @war_deck, @player2.deck
  end

  def test_it_can_check_mutually_assured_destruction_type
    @player2 = Player.new("Aurora", @mad_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal :mutually_assured_destruction, @turn.type
  end

  def test_it_can_get_winner_for_mutually_assured_destruction
    @player2 = Player.new("Aurora", @mad_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal "No Winner", @turn.winner
  end

  def test_it_can_send_cards_to_spoils_of_war_for_mutual_destruction
    @player2 = Player.new("Aurora", @mad_deck)
    @turn = Turn.new(@player1, @player2)

    @turn.pile_cards

    assert_equal [], @turn.spoils_of_war
    assert_equal @deck1, @player1.deck
    assert_equal @mad_deck, @player2.deck
  end
end
