require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

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
    @card9 = Card.new(:club, '8', 8)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    # testing mutually_assured_destruction
    @deck3 = Deck.new([@card4, @card3, @card9, @card7])
    # testing war
    @deck4 = Deck.new([@card4, @card3, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
  end

  def test_it_exists
    #skip
    @turn = Turn.new(@player1, @player2)

    assert_instance_of Turn, @turn
  end

  def test_turn
    #skip
    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_basic_turn
    #skip
    @turn = Turn.new(@player1, @player2)

    assert_equal :basic, @turn.type
  end

  def test_mutually_assured_destruction_turn
    #skip
    @player2 = Player.new("Aurora", @deck3)
    @turn = Turn.new(@player1, @player2)

    assert_equal :mutually_assured_destruction, @turn.type
  end

  def test_war_turn
    #skip
    @player2 = Player.new("Aurora", @deck4)
    @turn = Turn.new(@player1, @player2)

    assert_equal :war, @turn.type
  end

  def test_basic_winner
    #skip
    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.winner
  end

  def test_mutually_assured_destruction_winner
    #skip
    @player2 = Player.new("Aurora", @deck3)
    @turn = Turn.new(@player1, @player2)

    assert_equal "No Winner", @turn.winner
  end

  def test_war_winner
     #skip
    @player2 = Player.new("Aurora", @deck4)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player2, @turn.winner
  end

  def test_basic_winner_when_player_deck_empty
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([])
    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.winner
  end
  binding.pry
  def test_basic_pile
     #skip
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_war_pile
    #skip
    @player2 = Player.new("Aurora", @deck4)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    assert_equal [@card1, @card2, @card5, @card4, @card3, @card6], @turn.spoils_of_war
  end

  def test_mutually_assured_destruction_pile
    @player2 = Player.new("Aurora", @deck3)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    assert_equal [], @turn.spoils_of_war
    assert_equal [@card8], @player1.deck.cards
    assert_equal [@card7], @player2.deck.cards
  end

  def test_award_spoils_basic
    #skip
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war

    @turn.award_spoils(@player1)

    assert_equal [@card2, @card5, @card8, @card1, @card3], @player1.deck.cards
    assert_equal [@card4, @card6, @card7], @player2.deck.cards
  end

  def test_award_spoils_war
    #skip
    @player2 = Player.new("Aurora", @deck4)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    assert_equal [@card1, @card2, @card5, @card4, @card3, @card6], @turn.spoils_of_war


    @turn.award_spoils(@player2)

    assert_equal [@card7, @card1, @card2, @card5, @card4, @card3, @card6], @player2.deck.cards
    assert_equal [@card8], @player1.deck.cards
  end
end
