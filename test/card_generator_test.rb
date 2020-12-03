require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  def setup
    @card_generator = CardGenerator.new
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_it_has_readable_attributes
    assert_equal [], @card_generator.deck1
    assert_equal [], @card_generator.deck2
    assert_equal [], @card_generator.main_deck
  end

  def test_creating_deck_of_cards
    @card_generator.create_cards
    assert_equal 52, @card_generator.main_deck.count
  end

  def test_creating_two_decks
    @card_generator.create_cards
    @card_generator.create_decks
    assert_equal 26, @card_generator.deck1.cards.count
    assert_equal 26, @card_generator.deck2.cards.count
  end
end
