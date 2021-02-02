require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    cards = CardGenerator.new('cards')
    assert_instance_of CardGenerator, cards
  end

  def test_it_can_generate_txt
    cards = CardGenerator.new('test.txt')
    cards.generate_txt
    real = File.open("cards.txt")
    test = File.open("test.txt")
    assert_equal real.read, test.read
  end

  def test_it_can_convert_txt_to_array
    cards = CardGenerator.new('test.txt')
    text = cards.file_to_array
    assert_equal text[0..2], ["2", "Spades", "2"]
  end

  def test_it_can_convert_arr_to_card
    cards = CardGenerator.new('test.txt')

    assert_equal cards.cards.size, 52
    assert_instance_of Card, cards.cards[0]
  end

end
