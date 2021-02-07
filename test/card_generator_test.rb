require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'


class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "2, Heart, 2"
    box_cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, box_cards
  end

  def test_it_has_attributes
    # skip
    filename = "2, Heart, 2"
    box_cards = CardGenerator.new(filename)

    assert_equal [:heart, "2", 2], box_cards.box_cards
  end

  def test_a_string_can_create_rank_value_suit
    skip
    data = "2, Heart, 2"
    card1 = CardGenerator.new(data)

    assert_equal [:heart, "2", 2], card1.get_card_info(data)

  end

  def test_a_string_can_create_rank_value_suit_with_another
    skip
    data = "King, Spade, 13"
    card1 = CardGenerator.new(data)

    assert_equal [:spade, "King", 13], card1.get_card_info(data)
  end

  def test_it_can_import_a_string_of_data
    skip
    file = File.new('cards.txt')
    lines = File.readlines(file, chomp: true)

    assert_equal "2, Heart, 2", lines[0]
  end

  def test_it_can_import_data_and_make_it_a_card
    skip
    file = File.new('cards.txt')
    lines = File.readlines(file, chomp: true)
    # card1 = CardGenerator.new(lines[0])

    assert_equal [:heart, "2", 2], card1 = CardGenerator.new(lines[0])
  end

end
