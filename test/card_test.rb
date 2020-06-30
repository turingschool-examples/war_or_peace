require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"

class CardTest < Minitest::Test
  def setup
    @card = Card.new(:heat, 'Jack', 11)
  end
  def test_it_exists
    assert_instance_of Card, @card
  end

  #def test_it_has_attributes
  #end

end
