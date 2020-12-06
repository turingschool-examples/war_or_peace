require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    card_generator = CardGenerator.new("cards.txt")

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_readable_attributes
    card_generator = CardGenerator.new("cards.txt")

    assert_equal "cards.txt", card_generator.filename
  end

  def test_cards
    card_generator = CardGenerator.new("cards.txt")

    assert_equal :heart, card_generator.cards[0].suit
    assert_equal '2', card_generator.cards[0].value
    assert_equal 2, card_generator.cards[0].rank

    assert_equal :spade, card_generator.cards[51].suit
    assert_equal 'Ace', card_generator.cards[51].value
    assert_equal 14, card_generator.cards[51].rank
  end
end
