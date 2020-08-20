require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'

class WarOrPeaceTest < Minitest::Test
  def test_it_exists
    war_or_peace = WarOrPeace.new

    assert_instance_of WarOrPeace, war_or_peace
  end

  def test_it_can_create_fifty_two_cards
    # skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards

    assert_equal 52, war_or_peace.playing_cards.length
  end

  def test_there_are_four_suits_in_the_deck
    skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
    variable = war_or_peace.create_cards.group_by {|card| card.class}

    assert_equal 4, war_or_peace.variable.length
  end

  def test_each_suit_has_thirteen_cards
    skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
  end

  def test_it_can_split_the_deck_into_two_hands
    # skip
    war_or_peace = WarOrPeace.new
    war_or_peace.create_cards
    war_or_peace.make_two_hands

    assert 26, war_or_peace.hand1.length
    assert 26, war_or_peace.hand2.length
  end

  def test_two_players_have_their_own_unique_hands
    skip
  end

end
