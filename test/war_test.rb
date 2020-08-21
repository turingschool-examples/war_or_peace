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
  end

  def test_can_create_deck
    assert_instance_of Deck, @war.create_decks_for_players
  end

  def test_can_create_fully_functional_turn
    @war.create_decks_for_players
    @war.create_players
    @war.create_turn
    assert_instance_of Turn, @war.turn
    assert_instance_of Player, @war.turn.player1
    assert_instance_of Player, @war.turn.player2
  end

end
