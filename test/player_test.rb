require 'minitest/autorun'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
  end

  def test_it_has_readable_attributes
    assert_equal "Clarisa", @player.name
  end

end
