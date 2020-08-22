require './lib/deck'
require './lib/card'
require './lib/card_generator'
require 'minitest/autorun'
require 'minitest/pride'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_a_filename
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_equal "cards.txt", card_generator.filename
  end

end
