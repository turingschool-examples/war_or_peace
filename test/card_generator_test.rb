require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    new_cards = CardGenerator.new

    assert_instance_of CardGenerator, new_cards
  end


  def test_it_has_a_text_file_to_read
    # skip
    new_cards = CardGenerator.new


    assert_equal new_cards.show_text_file.length, 748
  end


  def test_it_has_52_cards
    new_cards = CardGenerator.new

    assert_equal new_cards.all_cards.length, 52
  end

  def test_it_has_no_duplicates
    new_cards = CardGenerator.new

    assert_equal new_cards.all_cards.uniq, new_cards.all_cards
  end


end
