require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    new_cards = CardGenerator.new

    assert_instance_of CardGenerator, new_cards
  end


  def test_it_has_52_cards
    new_cards = CardGenerator.new

    assert_equal new_cards.cards_split.length, 52
  end

  def test_it_has_no_duplicates
    new_cards = CardGenerator.new

    assert_equal new_cards.cards_split.uniq, new_cards.cards_split
  end

  def test_it_can_assign_values
    new_cards = CardGenerator.new

    assert_equal new_cards.assign_values, new_cards.card_values_split[0][2]
  end


end
