require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

class TestTurn <Minitest::Test

  attr_accessor :deck1, :deck2
  attr_reader :turn, :player1, :player2

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:spade, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)
    @turn = Turn.new(player1, player2)
  end

  def test_turn_exists
    assert_instance_of Turn, turn
  end

  def test_turn_has_attributes
    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
    assert_equal [], turn.spoils_of_war
  end

  def test_turn_has_type
    assert_equal :basic, turn.type
  end

  def test_winner_of_turn
    turn.type

    assert_equal player1, turn.winner
  end

  def test_pile_of_cards
    turn.type
    turn.pile_of_cards
    assert_equal [@card1, @card3], turn.spoils_of_war
    assert_equal [@card2,@card5,@card8], player1.deck.cards
    assert_equal [@card4,@card6,@card7], player2.deck.cards
  end

  def test_award_spoils
    winner = turn.winner
    turn.pile_of_cards
    turn.award_spoils(winner)
    assert_equal [@card2, @card5, @card8, @card1, @card3], player1.deck.cards
    assert_equal [@card4,@card6,@card7], player2.deck.cards
  end

end
