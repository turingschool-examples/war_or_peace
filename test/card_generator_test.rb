require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = './lib/cards.csv'
    cards = CardGenerator.new(filename).cards
    assert_instance_of cards, CardGenerator
  end
end
