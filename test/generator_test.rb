require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/generator'

class GeneratorTest < Minitest::Test
  def test_it_exists
    card_generator = Generator.new

    assert_instance_of Generator, card_generator
  end

  def test_you_can_build_a_card
    card_generator = Generator.new
    card_generator.build_cards

    assert_equal 13, card_generator.card.length
  end

end
