require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)

    @deck1 = Deck.new([card1, card2])
    @deck2 = Deck.new([card3, card4])

    @player1 = Player.new('Alex', @deck1)
    @player2 = Player.new('Bob', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of(Turn, @turn);
  end

  def test_it_has_readable_attributes
    # player1
    assert_equal @player1, @turn.player1
    # player2
    assert_equal @player2, @turn.player2
    # spoils_of_war
    assert_equal [], @turn.spoils_of_war
  end

  def test_has_lost_lose_condition
    skip
    @player.deck.cards.clear
    assert_equal true, @player.has_lost?
  end

  def test_has_lost_continue_condition
    skip
    # As of data setup, player has NOT lost
    assert_equal false, @player.has_lost?
  end
end
