require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test
  def test_exists
    CardGenerator.new.generate_cards('./test/test_cards.txt')
  end

  def test_cards
    test_cards =
      [
        Card.new(:heart, '2', 2),
        Card.new(:heart, '3', 3),
        Card.new(:heart, '4', 4),
        Card.new(:heart, '5', 5)
      ]

    assert_equal test_cards, CardGenerator.new.generate_cards('./test/test_cards.txt')
  end
end
