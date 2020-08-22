require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'


class WarOrPeaceRunnerTest < MiniTest::Test

  def test_cards_are_created
    card = Card.new(suit, value, rank)

    assert_equal true, card
    assert_equal true, full_deck_of_cards
  end


end
