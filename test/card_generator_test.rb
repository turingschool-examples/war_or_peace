require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @card_generator = CardGenerator.new
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_create_standard_deck
    assert_equal 52, @card_generator.create_standard_deck.count
  end
end
