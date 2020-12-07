require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class PlayerTest < Minitest::Test
  def test_it_exists
    generator = CardGenerator.new('cards.txt')

    assert_instance_of CardGenerator, generator
  end

  def test_filename
    generator = CardGenerator.new('cards.txt')
    fname = generator.filename

    assert_equal 'cards.txt', fname
  end

  def test_set_cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '2', 2)
    g = CardGenerator.new('test.txt')
    g.set_cards

    assert_equal [card1, card2].length, g.cards.length
  end
end
