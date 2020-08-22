require './test/test_helper'

class WarTest < Minitest::Test
  def setup
    @war = War.new
  end

  def test_it_exists
    assert_instance_of War, @war
  end

  def test_it_has_a_full_deck
    assert_equal 52, @war.full_deck.length
    @war.full_deck.each {|card| assert_instance_of Card, card}
  end

  def test_can_create_fully_functional_turn
    assert_instance_of Turn, @war.turn
    assert_instance_of Player, @war.turn.player1
    assert_instance_of Player, @war.turn.player2
    assert_instance_of Deck, @war.turn.player1.deck
    assert_instance_of Deck, @war.turn.player2.deck
  end

end
