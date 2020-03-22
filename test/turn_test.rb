require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'
require '../lib/player'
require '../lib/turn'

class RunTest < Minitest::Test
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

  def test_turn

    @deck3 = Deck.new([@card1, @card2, @card5, @card8])
    @deck4 = Deck.new([@card1, @card4, @card6, @card7])
    @deck5 = Deck.new([@card1, @card2, @card5, @card8])
    @deck6 = Deck.new([@card1, @card4, @card5, @card7])

    @player3 = Player.new("Megan", @deck3)
    @player4 = Player.new("Aurora", @deck4)
    @player5 = Player.new("Megan", @deck5)
    @player6 = Player.new("Aurora", @deck6)

    @turn = Turn.new(@player1, @player2)
    @turn1 = Turn.new(@player3, @player4)
    @turn2 = Turn.new(@player5, @player6)

    assert_equal :basic, @turn.type
    assert_equal :war, @turn1.type
    assert_equal :mutually_assured_destruction, @turn2.type
  end

  def test_basic_turn_winner

  
    # # winner: this method will determine the winner of the turn.
    # # if the turn has a type of :basic, it will return whichever
    #  player has a higher rank_of_card_at(0)
    # # if the turn has a type of :war the winner will be whichever player
    # has a higher rank_of_card_at(2)
    # # if the turn has a type of :mutually_assured_destruction
    # the method will return No Winner.
    assert_equal @player1, @turn.winner
  end

  def test_war_turn_winner
    assert_equal @player4, @turn1.winner
  end

  def test_mutually_assured_destruction_winner
    assert_equal 'No Winner', @turn2.winner
  end

  def test_spoils_of_war
  skip
  end

end
