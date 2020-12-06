require 'minitest/autorun'
require 'minitest/pride'
require './lib/generator'

class GeneratorTest < Minitest::Test

  def test_it_exists
    generator = Generator.new("./lib/cards.txt")

    assert_instance_of Generator, generator
  end

  def test_creates_52_cards
    generator = Generator.new("./lib/cards.txt")

    assert_equal 52, generator.cards.count
  end
end
