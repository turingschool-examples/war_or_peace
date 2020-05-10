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

  def test_it_says_hello
    assert_equal "hello", @card_generator.hi
  end

  def test_it_starts_with_an_empty_array
    assert_instance_of Array, @card_generator.arr
    assert_empty @card_generator.arr
  end

  def test_it_has_an_integer_number
    assert_instance_of Integer, @card_generator.i
  end

  def test_it_starts_at_number_2
    assert_equal 2, @card_generator.i
  end

end
