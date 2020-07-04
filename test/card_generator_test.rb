require './lib/card_generator'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class CardGeneratorTest < Minitest::Test
  def setup
    @filename = "cards.txt"
  end

  def test_it_exists
    card_gen = CardGenerator.new(@filename)

    assert_instance_of CardGenerator, card_gen
  end

  def test_it_generates_card_objects
    card_gen = CardGenerator.new(@filename)

    card_gen.generate_cards

    assert_instance_of Card, card_gen.cards[0]
  end

  def test_it_generates_full_deck
    card_gen = CardGenerator.new(@filename)

    card_gen.generate_cards

    assert_equal 52, card_gen.cards.length
  end
end
