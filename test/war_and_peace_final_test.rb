require "minitest/autorun"
require '../lib/war_and_peace_final'

class WarAndPeaceRunnerTest < Minitest::Test
  def setup
    @runner = WarAndPeaceRunner.new
  end

  def test_it_has_correct_number_of_cards
    assert_equal 2, @runner.setup_cards.length
    assert_equal 26, @runner.setup_cards.first.length
    assert_instance_of Card, @runner.setup_cards.first.first
  end
end
