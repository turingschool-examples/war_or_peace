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
    assert @card_generator.cards.all? {|card| card.kind_of?(Card)}
    assert_equal false, @card_generator.cards.any? {|card| card.rank.kind_of?(Integer) == false}
    assert_equal false, @card_generator.cards.any? {|card| card.suit.kind_of?(Symbol) == false}
    assert_equal 14, @card_generator.cards[51].rank
    assert_equal "Ace", @card_generator.cards[51].value
    assert_equal :spade, @card_generator.cards[51].suit
    refute_equal :diamond, @card_generator.cards[51].suit
  end

  def test_there_are_four_of_each_value
    assert_equal 4, @card_generator.cards.count {|card| card.value == "Ace"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "King"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "Queen"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "Jack"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "10"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "9"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "8"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "7"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "6"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "5"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "4"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "3"}
    assert_equal 4, @card_generator.cards.count {|card| card.value == "2"}
  end

  def test_there_are_four_of_each_rank
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 14}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 13}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 12}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 11}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 10}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 9}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 8}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 7}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 6}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 5}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 4}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 3}
    assert_equal 4, @card_generator.cards.count {|card| card.rank == 2}
  end

  def test_there_are_thirteen_of_each_suit
    assert_equal 13, @card_generator.cards.count {|card| card.suit == :diamond}
    assert_equal 13, @card_generator.cards.count {|card| card.suit == :club}
    assert_equal 13, @card_generator.cards.count {|card| card.suit == :heart}
    assert_equal 13, @card_generator.cards.count {|card| card.suit == :spade}
  end


end
