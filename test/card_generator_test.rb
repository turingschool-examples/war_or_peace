require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_generator'
require_relative '../lib/cards.txt'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "../lib/cards.txt"

    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_it_can_produce_a_full_deck
    filename = "../lib/cards.txt"

    cards = CardGenerator.new(filename)

    assert_equal 52, cards.length
end
