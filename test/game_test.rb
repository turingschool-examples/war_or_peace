require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

class StartTest < Minitest::Test
  def test_it_exists
    start = Start.new
    assert_instance_of Start, start
  end

  def test_it_

  end
end
