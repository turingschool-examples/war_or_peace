require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "deck_of_cards.txt"
    card_gen = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_gen
  end
  
end
