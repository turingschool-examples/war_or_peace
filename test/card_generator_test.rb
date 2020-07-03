require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    new_cards = CardGenerator.new

    assert_instance_of CardGenerator, new_cards
  end

  def test_it_has_a_text_file_to_read
    new_cards = CardGenerator.new


    assert_equal new_cards.show_text_file, 174
  end

  def test_it_can_read_each_word_independently
    new_cards = CardGenerator.new

end
