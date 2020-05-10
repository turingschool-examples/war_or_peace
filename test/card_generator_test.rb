require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'


class CardGeneratorTest < Minitest::Test

  def setup
    @card_generator = CardGenerator.new(0)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_it_says_hello
    assert_equal "hello", @card_generator.hi
  end

  def test_it_starts_with_an_empty_array
    assert_instance_of Array, @card_generator.suits
    assert_empty @card_generator.suits
  end

  def test_it_has_an_integer_number
    assert_instance_of Integer, @card_generator.i
  end

  def test_it_starts_at_number_0
    assert_equal 0, @card_generator.i
  end

  def test_it_can_have_a_different_number
    diff = CardGenerator.new(2)
    assert_equal 2, diff.i
  end

  def test_it_can_put_that_number_in_the_array

    assert_empty @card_generator.suits
    @card_generator.move_it
    assert_equal [0], @card_generator.suits

    diff = CardGenerator.new(2)
    diff.move_it
    assert_equal [2], diff.suits

  end

  def test_it_can_have_standard_suits
    @card_generator.standardize

    assert_equal [:club, :spade, :heart, :diamond], @card_generator.suits
  end

  def test_it_can_have_tarot_suits
    @card_generator.tarotize

    assert_equal [:cup, :wand, :coin, :sword], @card_generator.suits
  end

  def test_it_has_a_standard_royal_family
    assert_equal ["Jack", "Queen", "King"], @card_generator.royal
  end

  def test_it_has_an_ace_in_the_hole
    assert_equal ["Ace"], @card_generator.ace
  end

  def test_it_has_a_royal_knight_when_tarot
    @card_generator.tarotize

    assert_equal ["Knight", "Jack", "Queen", "King"], @card_generator.royal
  end

  def test_it_has_aces_high_in_standard
    @card_generator.standardize

    assert_equal true, @card_generator.aces_high?
  end

  def test_it_has_aces_low_in_tarot
    @card_generator.tarotize

    assert_equal false, @card_generator.aces_high?
  end

  def test_it_has_an_array_of_strings_representing_numbers

    expected = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]

    assert_equal expected, @card_generator.numbers
    assert_equal true, @card_generator.numbers.all? {|number| number.class == String}
  end

  def test_it_has_aces_high_in_standard

    expected = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

    @card_generator.standardize

    assert_equal expected, @card_generator.pecking_order
  end



  def test_it_has_different_cards_in_tarot

    expected = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Knight", "Jack", "Queen", "King"]

    @card_generator.tarotize

    assert_equal expected, @card_generator.pecking_order
  end

end
