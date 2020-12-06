require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'

class RunnerTest < Minitest::Test

  def test_normalize_value_converts_ranks_appropriately
    assert_equal 'Ace', normalize_value(1)
    assert_equal '5', normalize_value(5)
    assert_equal 'Queen', normalize_value(12)
  end

end

#check that deck1 and deck2 don't share cards
# intersection (ar1 & ar2).any?
