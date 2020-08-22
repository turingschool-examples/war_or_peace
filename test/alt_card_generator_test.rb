require './test/test_helper'

class AltCardGeneratorTest < Minitest::Test
  def setup
    @alt_card_generator = AltCardGenerator.new
  end

  def test_alt_exists
    assert_instance_of AltCardGenerator, @alt_card_generator
  end

  def test_alt_cards_attribute_is_array
    assert @alt_card_generator.cards.kind_of?(Array)
  end

  def test_alt_fifty_two_cards_are_generated
    assert_equal 52, @alt_card_generator.cards.length
  end

  def test_alt_cards_are_instances_of_card_class
    assert @alt_card_generator.cards.all? {|card| card.kind_of?(Card)}
    assert @alt_card_generator.cards.all? {|card| card.rank.kind_of?(Integer)}
    assert @alt_card_generator.cards.all? {|card| card.suit.kind_of?(Symbol)}
  end

  def test_alt_there_are_four_of_each_value
    values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack",
    "Queen", "King", "Ace"]
    values.each do |value|
      assert_equal 4, @alt_card_generator.cards.count {|card| card.value == value}
    end
  end

  def test_alt_there_are_four_of_each_rank
    (2..14).each do |number|
      assert_equal 4, @alt_card_generator.cards.count {|card| card.rank == number}
    end
  end

  def test_alt_there_are_thirteen_of_each_suit
    symbols = [:heart, :diamond, :club, :spade]
    symbols.each do |symbol|
      assert_equal 13, @alt_card_generator.cards.count {|card| card.suit == symbol}
    end
  end

end
