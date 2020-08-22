require './lib/deck'
require './lib/card'
require './lib/card_generator'
require 'minitest/autorun'
require 'minitest/pride'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_a_filename
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_equal "cards.txt", card_generator.filename
  end

  def test_it_generates_cards
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    #check total cards
    assert_equal 52, card_generator.cards.count

    #check first card
    assert_instance_of Card, card_generator.cards.first
    assert_equal "2", card_generator.cards.first.value
    assert_equal 2, card_generator.cards.first.rank
    assert_equal :heart, card_generator.cards.first.suit

    #check last card
    assert_instance_of Card, card_generator.cards.last
    assert_equal "Ace", card_generator.cards.last.value
    assert_equal 14, card_generator.cards.last.rank
    assert_equal :diamond, card_generator.cards.last.suit
  end

end
