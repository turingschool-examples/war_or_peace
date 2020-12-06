require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    card_generator = CardGenerator.new

    assert_instance_of CardGenerator, card_generator
  end
end
