require './test/test_helper'

class CardGeneratorTest < Minitest::Test
  def setup
    @card_generator = CardGenerator.new("cards.txt")
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_cards_attributes_is_array
    assert @card_generator.cards.kind_of?(Array)
  end

  def test_fifty_two_cards_are_generated
    assert_equal 52, @card_generator.cards.length
  end

  def test_cards_are_instances_of_card_class
    assert_instance_of Card, @card_generator.cards[0]
    assert_equal 14, @card_generator.cards[51].rank
    assert_equal "Ace", @card_generator.cards[51].value
    assert_equal :spade, @card_generator.cards[51].suit
    refute_equal :diamond, @card_generator.cards[51].suit
  end

end
