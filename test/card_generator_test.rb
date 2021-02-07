require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'


class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = ["2, Heart, 2"]
    box_cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, box_cards
  end

  def test_it_has_attributes
    # skip
    filename = ["2, Heart, 2"]
    box_cards = CardGenerator.new(filename)

    assert_equal :heart, box_cards.cards[0].suit
  end

  def test_a_string_can_create_rank_value_suit
    # skip
    data = ["2, Heart, 2"]
    card1 = CardGenerator.new(data)

    assert_equal 2, card1.cards[0].rank
  end

  def test_a_string_can_create_rank_value_suit_with_another
    # skip
    data = ["King, Spade, 13"]
    card1 = CardGenerator.new(data)

    assert_equal "King", card1.cards[0].value
  end

  def test_it_can_import_a_string_of_data
    # skip
    file = File.new('cards.txt')
    lines = File.readlines(file, chomp: true)

    assert_equal "2, Heart, 2", lines[0]
  end

  def test_it_can_import_data_and_make_it_a_card
      # skip
    file = File.new('cards.txt')
    lines = File.readlines(file, chomp: true)
    card1 = CardGenerator.new([lines[0]])

    assert_equal Card, card1.cards[0].class
  end

  def test_it_can_import_two_lines_and_convert
    # skip
    file = File.new('cards.txt')
    lines = File.readlines(file, chomp: true)
    card1 = CardGenerator.new([lines[0]])
    card2 = CardGenerator.new([lines[1]])

    assert_equal card2.cards, card2.cards
  end

  def test_see_what_happens_when_we_enter_all_data
    # skip
    file = File.new('cards.txt')
    lines = File.readlines(file, chomp: true)
    full_deck = CardGenerator.new(lines)

    assert_equal "All the cards", full_deck.cards
  end


end
