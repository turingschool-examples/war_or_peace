require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'


class CardGeneratorTest < Minitest::Test

  # it is initialized with an integer argument
  def setup
    @card_generator = CardGenerator.new(0)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  # it returns string data
  def test_it_says_hello
    assert_equal "hello", @card_generator.hi
  end

  def test_it_initializes_with_an_empty_array

    assert_instance_of Array, @card_generator.suits
    assert_empty @card_generator.suits

  end

  def test_it_can_take_any_integer_input

    assert_instance_of Integer, @card_generator.i
    assert_equal 0, @card_generator.i

    one = CardGenerator.new(1)
    assert_equal 1, one.i

    two = CardGenerator.new(2)
    assert_equal 2, two.i

    three = CardGenerator.new(3)
    assert_equal 3, three.i

  end

  def test_it_will_take_only_integer_input
    skip

    assert_instance_of Integer, @card_generator.i
    assert_equal 0, @card_generator.i

    one = CardGenerator.new(a)
    assert_equal "Please enter an Integer number (a Whole number)", one.i

    two = CardGenerator.new(2)
    assert_equal nil, two.i

    three = CardGenerator.new(3)
    assert_equal 3, three.i

  end

  def test_it_has_a_method_to_move_input_into_array

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

  # it manipulates arrays of strings
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

  def test_it_has_different_deck_size_for_different_styles

    @card_generator.standardize

    expected = @card_generator.pecking_order.size * @card_generator.suits.size

    assert_equal expected, @card_generator.deck_size
    assert_equal 52, @card_generator.deck_size


    diff = CardGenerator.new(0)
    diff.tarotize

    expected = diff.pecking_order.size * diff.suits.size

    assert_equal expected, diff.deck_size
    assert_equal 56, diff.deck_size

  end

  def test_it_cannot_multiply_if_style_is_nil
    skip

    assert_nil @card_generator.style

    # @card_generator.deck_size
    # => NoMethodError

  end

  def test_it_starts_with_a_style_attribute_nil

    assert_nil @card_generator.style

    diff = CardGenerator.new(0)

    assert_nil diff.style

  end

  def test_it_can_change_its_style

    assert_nil @card_generator.style
    @card_generator.tarotize

    expected = "Tarotized"

    assert_equal expected, @card_generator.style

    diff = CardGenerator.new(0)
    diff.standardize

    expected = "Standardized"
    assert_equal expected, diff.style

  end

  def test_it_
  end

end
