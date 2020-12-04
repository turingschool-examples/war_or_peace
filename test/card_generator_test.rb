require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  def test_it_exists
    card_generator = CardGenerator.new("cards.txt")
    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_readable_attributes
    card_generator = CardGenerator.new("cards.txt")
    assert_equal [], card_generator.deck1
    assert_equal [], card_generator.deck2
  end

  def test_creating_deck_of_cards
    card_generator = CardGenerator.new("cards.txt")
    assert_equal 52, card_generator.cards.count
  end

  def test_creating_two_decks
    card_generator = CardGenerator.new("cards.txt")
    card_generator.create_cards
    card_generator.create_decks
    assert_equal 26, card_generator.deck1.cards.count
    assert_equal 26, card_generator.deck2.cards.count
  end
end
