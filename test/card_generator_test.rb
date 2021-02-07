require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'


class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = File.new('cards.txt')
    box_cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, box_cards
  end

  def test_it_has_attributes
    filename = File.new('cards.txt')
    box_cards = CardGenerator.new(filename)
# require "pry"; binding.pry
    assert_equal filename, box_cards.filename
  end

  def test_a_string_can_create_rank_value_suit
    data = ["2, Heart, 2"]
    card1 = CardGenerator.new(data)


    assert_equal [:heart, "2", 2], card1.get_card_info(data)

  end


end
