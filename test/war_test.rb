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

  def test_can_create_deck_with_alternate_generator
    @war.create_full_deck_without_text_file
    assert_equal 52, @war.full_deck.length
    @war.full_deck.each {|card| assert_instance_of Card, card}
  end

  def test_can_split_and_shuffle_decks
    refute_equal @war.full_deck[0..25], @war.turn.player1.deck.cards
    refute_equal @war.full_deck[26..51], @war.turn.player2.deck.cards
  end

  def test_can_create_fully_functional_turn
    assert_instance_of Turn, @war.turn
    assert_instance_of Player, @war.turn.player1
    assert_instance_of Player, @war.turn.player2
    assert_instance_of Deck, @war.turn.player1.deck
    assert_instance_of Deck, @war.turn.player2.deck
  end

  def test_no_two_decks_are_the_same
    war_2 = War.new
    refute_equal war_2.turn.player1.deck.cards, @war.turn.player1.deck.cards
    refute_equal war_2.turn.player2.deck.cards, @war.turn.player2.deck.cards
  end

  def test_can_show_winner
    assert_equal "---- DRAW ----", @war.show_winner
    @war.turn.player2.deck.cards.clear
    @war.turn.type
    @war.turn.determine_winner
    assert_equal "*~*~*~* Geordie has won the game! *~*~*~*", @war.show_winner
  end

end
