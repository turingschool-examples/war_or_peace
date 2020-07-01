require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/player.rb'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new
  end
end
