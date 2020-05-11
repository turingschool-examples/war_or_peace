require 'minitest/autorun'
require 'minitest/pride'
require_relative './card_text_file_generator'


class CardTextFileGeneratorTest < Minitest::Test

  # it is initialized with an integer argument
  def setup
    @card_generator = CardTextFileGenerator.new(0)
  end

  def test_it_exists
    assert_instance_of CardTextFileGenerator, @card_generator
  end

  def test_it_initializes_with_an_empty_suits_array

    assert_instance_of Array, @card_generator.suits
    assert_empty @card_generator.suits

  end

  def test_it_can_take_any_integer_input

    assert_instance_of Integer, @card_generator.i
    assert_equal 0, @card_generator.i

    one = CardTextFileGenerator.new(1)
    assert_equal 1, one.i

    two = CardTextFileGenerator.new(2)
    assert_equal 2, two.i

    three = CardTextFileGenerator.new(3)
    assert_equal 3, three.i

  end

  def test_it_will_take_only_integer_input
    skip

    assert_instance_of Integer, @card_generator.i
    assert_equal 0, @card_generator.i

    one = CardTextFileGenerator.new(a)
    assert_equal "Please enter an Integer number (a Whole number)", one.i

    two = CardTextFileGenerator.new(2)
    assert_equal nil, two.i

    three = CardTextFileGenerator.new(3)
    assert_equal 3, three.i

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

  def test_it_has_aces_after_king_in_standard

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


    diff = CardTextFileGenerator.new(0)
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

    diff = CardTextFileGenerator.new(0)

    assert_nil diff.style

  end

  def test_it_can_change_its_style

    assert_nil @card_generator.style
    @card_generator.tarotize

    expected = "Tarotized"

    assert_equal expected, @card_generator.style

    diff = CardTextFileGenerator.new(0)
    diff.standardize

    expected = "Standardized"
    assert_equal expected, diff.style

  end

  def test_it_can_multiply_deck_size_by_an_integer
    @card_generator.standardize

    assert_equal 0, @card_generator.i
    @card

    expected = @card_generator.i * @card_generator.deck_size

    assert_equal expected, @card_generator.cards_to_print

    assert_equal 0, @card_generator.cards_to_print
  end

  def test_it_can_multiply_deck_size_by_a_diff_integer
    diff = CardTextFileGenerator.new(2)
    diff.tarotize

    assert_equal 2, diff.i
    expected = diff.i * diff.deck_size

    assert_equal expected, diff.cards_to_print
  end

  def test_it_will_not_be_shuffled_by_default
    assert_equal false, @card_generator.shuffled?
  end

  def test_it_will_know_after_it_gets_shuffled

    @card_generator.shuffle

    assert_equal true, @card_generator.shuffled?

  end

  def test_it_shuffles
    skip
    @card_generator.standardize

    deck_arr = @card_generator.generate_deck

    deck_shuffle = @card_generator.shuffle

    assert_equal false, deck_arr == deck_shuffle
    refute deck_arr == deck_shuffle

  end


  def test_it_can_match_suits_to_pecking_order_and_values
    # the principle is sound!
    let_arr = ["a", "b"]
    num_arr = ["2", "3", "4", "5"]

    expected = [["2", "a", "2"], ["3", "a", "3"], ["4", "a", "4"], ["5", "a", "5"], ["2", "b", "2"], ["3", "b", "3"], ["4", "b", "4"], ["5", "b", "5"]]


    d_arr = Array.new

    let_arr.each do |let|
      num_arr.each.with_index(2) do |num, i|
        d_arr << [num, let, i.to_s]
      end
    end

    assert_equal expected, d_arr

  end

  def test_it_can_generate_the_literal_standard_deck
    skip
    expected = [["2", :club, "2"], ["3", :club, "3"], ["4", :club, "4"], ["5", :club, "5"], ["6", :club, "6"], ["7", :club, "7"], ["8", :club, "8"], ["9", :club, "9"], ["10", :club, "10"], ["Jack", :club, "11"], ["Queen", :club, "12"], ["King", :club, "13"], ["Ace", :club, "14"], ["2", :spade, "2"], ["3", :spade, "3"], ["4", :spade, "4"], ["5", :spade, "5"], ["6", :spade, "6"], ["7", :spade, "7"], ["8", :spade, "8"], ["9", :spade, "9"], ["10", :spade, "10"], ["Jack", :spade, "11"], ["Queen", :spade, "12"], ["King", :spade, "13"], ["Ace", :spade, "14"], ["2", :heart, "2"], ["3", :heart, "3"], ["4", :heart, "4"], ["5", :heart, "5"], ["6", :heart, "6"], ["7", :heart, "7"], ["8", :heart, "8"], ["9", :heart, "9"], ["10", :heart, "10"], ["Jack", :heart, "11"], ["Queen", :heart, "12"], ["King", :heart, "13"], ["Ace", :heart, "14"], ["2", :diamond, "2"], ["3", :diamond, "3"], ["4", :diamond, "4"], ["5", :diamond, "5"], ["6", :diamond, "6"], ["7", :diamond, "7"], ["8", :diamond, "8"], ["9", :diamond, "9"], ["10", :diamond, "10"], ["Jack", :diamond, "11"], ["Queen", :diamond, "12"], ["King", :diamond, "13"], ["Ace", :diamond, "14"]]

    deck_stan = CardTextFileGenerator.new(1)
    deck_stan.standardize

    assert_equal expected, deck_stan.generate_deck

  end

  def test_it_can_generate_the_literal_tarot_deck
    skip
    expected = [["Ace", :cup, "1"], ["2", :cup, "2"], ["3", :cup, "3"], ["4", :cup, "4"], ["5", :cup, "5"], ["6", :cup, "6"], ["7", :cup, "7"], ["8", :cup, "8"], ["9", :cup, "9"], ["10", :cup, "10"], ["Knight", :cup, "11"], ["Jack", :cup, "12"], ["Queen", :cup, "13"], ["King", :cup, "14"], ["Ace", :wand, "1"], ["2", :wand, "2"], ["3", :wand, "3"], ["4", :wand, "4"], ["5", :wand, "5"], ["6", :wand, "6"], ["7", :wand, "7"], ["8", :wand, "8"], ["9", :wand, "9"], ["10", :wand, "10"], ["Knight", :wand, "11"], ["Jack", :wand, "12"], ["Queen", :wand, "13"], ["King", :wand, "14"], ["Ace", :coin, "1"], ["2", :coin, "2"], ["3", :coin, "3"], ["4", :coin, "4"], ["5", :coin, "5"], ["6", :coin, "6"], ["7", :coin, "7"], ["8", :coin, "8"], ["9", :coin, "9"], ["10", :coin, "10"], ["Knight", :coin, "11"], ["Jack", :coin, "12"], ["Queen", :coin, "13"], ["King", :coin, "14"], ["Ace", :sword, "1"], ["2", :sword, "2"], ["3", :sword, "3"], ["4", :sword, "4"], ["5", :sword, "5"], ["6", :sword, "6"], ["7", :sword, "7"], ["8", :sword, "8"], ["9", :sword, "9"], ["10", :sword, "10"], ["Knight", :sword, "11"], ["Jack", :sword, "12"], ["Queen", :sword, "13"], ["King", :sword, "14"]]

    deck_taro = CardTextFileGenerator.new(1)

    deck_taro.tarotize

    assert_equal expected, deck_taro.generate_deck
  end

  def test_it_can_generate_more_than_one_deck
    skip
    expected = [["2", :club, "2"], ["3", :club, "3"], ["4", :club, "4"], ["5", :club, "5"], ["6", :club, "6"], ["7", :club, "7"], ["8", :club, "8"], ["9", :club, "9"], ["10", :club, "10"], ["Jack", :club, "11"], ["Queen", :club, "12"], ["King", :club, "13"], ["Ace", :club, "14"], ["2", :spade, "2"], ["3", :spade, "3"], ["4", :spade, "4"], ["5", :spade, "5"], ["6", :spade, "6"], ["7", :spade, "7"], ["8", :spade, "8"], ["9", :spade, "9"], ["10", :spade, "10"], ["Jack", :spade, "11"], ["Queen", :spade, "12"], ["King", :spade, "13"], ["Ace", :spade, "14"], ["2", :heart, "2"], ["3", :heart, "3"], ["4", :heart, "4"], ["5", :heart, "5"], ["6", :heart, "6"], ["7", :heart, "7"], ["8", :heart, "8"], ["9", :heart, "9"], ["10", :heart, "10"], ["Jack", :heart, "11"], ["Queen", :heart, "12"], ["King", :heart, "13"], ["Ace", :heart, "14"], ["2", :diamond, "2"], ["3", :diamond, "3"], ["4", :diamond, "4"], ["5", :diamond, "5"], ["6", :diamond, "6"], ["7", :diamond, "7"], ["8", :diamond, "8"], ["9", :diamond, "9"], ["10", :diamond, "10"], ["Jack", :diamond, "11"], ["Queen", :diamond, "12"], ["King", :diamond, "13"], ["Ace", :diamond, "14"],["2", :club, "2"], ["3", :club, "3"], ["4", :club, "4"], ["5", :club, "5"], ["6", :club, "6"], ["7", :club, "7"], ["8", :club, "8"], ["9", :club, "9"], ["10", :club, "10"], ["Jack", :club, "11"], ["Queen", :club, "12"], ["King", :club, "13"], ["Ace", :club, "14"], ["2", :spade, "2"], ["3", :spade, "3"], ["4", :spade, "4"], ["5", :spade, "5"], ["6", :spade, "6"], ["7", :spade, "7"], ["8", :spade, "8"], ["9", :spade, "9"], ["10", :spade, "10"], ["Jack", :spade, "11"], ["Queen", :spade, "12"], ["King", :spade, "13"], ["Ace", :spade, "14"], ["2", :heart, "2"], ["3", :heart, "3"], ["4", :heart, "4"], ["5", :heart, "5"], ["6", :heart, "6"], ["7", :heart, "7"], ["8", :heart, "8"], ["9", :heart, "9"], ["10", :heart, "10"], ["Jack", :heart, "11"], ["Queen", :heart, "12"], ["King", :heart, "13"], ["Ace", :heart, "14"], ["2", :diamond, "2"], ["3", :diamond, "3"], ["4", :diamond, "4"], ["5", :diamond, "5"], ["6", :diamond, "6"], ["7", :diamond, "7"], ["8", :diamond, "8"], ["9", :diamond, "9"], ["10", :diamond, "10"], ["Jack", :diamond, "11"], ["Queen", :diamond, "12"], ["King", :diamond, "13"], ["Ace", :diamond, "14"]]

    deck_stan = CardTextFileGenerator.new(2)
    deck_stan.standardize

    assert_equal expected, deck_stan.generate_deck

  end

  def test_it_initializes_with_an_empty_deck_array
    assert_empty @card_generator.deck
  end

  def test_it_puts_a_deck_in_the_deck_array
    deck = CardTextFileGenerator.new(1)

    deck.standardize
    deck.generate_deck

    assert_equal 52, deck.deck.size
  end

  def test_it_puts_a_different_deck_in_the_deck_array
    deck = CardTextFileGenerator.new(1)

    deck.tarotize
    deck.generate_deck

    assert_equal 56, deck.deck.size
  end

  def test_it_puts_many_decks_in_the_deck_array
    deck = CardTextFileGenerator.new(3)

    deck.standardize
    deck.generate_deck

    assert_equal 52*3, deck.deck.size
  end

  def test_it_converts_symbols_to_upcase_strings_in_standard_deck_array
    expected = [["2", "Club", "2"], ["3", "Club", "3"], ["4", "Club", "4"], ["5", "Club", "5"], ["6", "Club", "6"], ["7", "Club", "7"], ["8", "Club", "8"], ["9", "Club", "9"], ["10", "Club", "10"], ["Jack", "Club", "11"], ["Queen", "Club", "12"], ["King", "Club", "13"], ["Ace", "Club", "14"], ["2", "Spade", "2"], ["3", "Spade", "3"], ["4", "Spade", "4"], ["5", "Spade", "5"], ["6", "Spade", "6"], ["7", "Spade", "7"], ["8", "Spade", "8"], ["9", "Spade", "9"], ["10", "Spade", "10"], ["Jack", "Spade", "11"], ["Queen", "Spade", "12"], ["King", "Spade", "13"], ["Ace", "Spade", "14"], ["2", "Heart", "2"], ["3", "Heart", "3"], ["4", "Heart", "4"], ["5", "Heart", "5"], ["6", "Heart", "6"], ["7", "Heart", "7"], ["8", "Heart", "8"], ["9", "Heart", "9"], ["10", "Heart", "10"], ["Jack", "Heart", "11"], ["Queen", "Heart", "12"], ["King", "Heart", "13"], ["Ace", "Heart", "14"], ["2", "Diamond", "2"], ["3", "Diamond", "3"], ["4", "Diamond", "4"], ["5", "Diamond", "5"], ["6", "Diamond", "6"], ["7", "Diamond", "7"], ["8", "Diamond", "8"], ["9", "Diamond", "9"], ["10", "Diamond", "10"], ["Jack", "Diamond", "11"], ["Queen", "Diamond", "12"], ["King", "Diamond", "13"], ["Ace", "Diamond", "14"]]

    deck = CardTextFileGenerator.new(1)

    deck.standardize
    deck.generate_deck

    assert_equal expected, deck.deck

  end

  def test_it_converts_symbols_to_upcase_strings_in_tarot_deck_array
    expected = [["Ace", "Cup", "1"], ["2", "Cup", "2"], ["3", "Cup", "3"], ["4", "Cup", "4"], ["5", "Cup", "5"], ["6", "Cup", "6"], ["7", "Cup", "7"], ["8", "Cup", "8"], ["9", "Cup", "9"], ["10", "Cup", "10"], ["Knight", "Cup", "11"], ["Jack", "Cup", "12"], ["Queen", "Cup", "13"], ["King", "Cup", "14"], ["Ace", "Wand", "1"], ["2", "Wand", "2"], ["3", "Wand", "3"], ["4", "Wand", "4"], ["5", "Wand", "5"], ["6", "Wand", "6"], ["7", "Wand", "7"], ["8", "Wand", "8"], ["9", "Wand", "9"], ["10", "Wand", "10"], ["Knight", "Wand", "11"], ["Jack", "Wand", "12"], ["Queen", "Wand", "13"], ["King", "Wand", "14"], ["Ace", "Coin", "1"], ["2", "Coin", "2"], ["3", "Coin", "3"], ["4", "Coin", "4"], ["5", "Coin", "5"], ["6", "Coin", "6"], ["7", "Coin", "7"], ["8", "Coin", "8"], ["9", "Coin", "9"], ["10", "Coin", "10"], ["Knight", "Coin", "11"], ["Jack", "Coin", "12"], ["Queen", "Coin", "13"], ["King", "Coin", "14"], ["Ace", "Sword", "1"], ["2", "Sword", "2"], ["3", "Sword", "3"], ["4", "Sword", "4"], ["5", "Sword", "5"], ["6", "Sword", "6"], ["7", "Sword", "7"], ["8", "Sword", "8"], ["9", "Sword", "9"], ["10", "Sword", "10"], ["Knight", "Sword", "11"], ["Jack", "Sword", "12"], ["Queen", "Sword", "13"], ["King", "Sword", "14"]]

    deck = CardTextFileGenerator.new(1)

    deck.tarotize
    deck.generate_deck

    assert_equal expected, deck.deck

  end


end
