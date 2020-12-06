require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    suits = [:heart, :spade, :club, :diamond]
    ranks ={
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
    }
    card_generator = CardGenerator.new(suits, ranks)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_readable_attributes
    suits = [:heart, :spade, :club, :diamond]
    ranks ={
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
    }

    card_generator = CardGenerator.new(suits, ranks)

    assert_equal suits, card_generator.suits
    assert_equal ranks, card_generator.ranks
    assert_equal [], card_generator.full_card_deck
  end

  def test_it_has_suits_and_ranks_by_default
    default_suits = [:heart, :spade, :club, :diamond]
    default_ranks ={
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
    }

    card_generator = CardGenerator.new(default_suits, default_ranks)

    card_generator.default_suits
    card_generator.default_ranks

    assert_equal default_suits, card_generator.default_suits
    assert_equal default_ranks, card_generator.default_ranks
  end

  def test_it_makes_a_standard_deck_of_cards
    suits = [:heart, :spade, :club, :diamond]
    ranks ={
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
    }

    card_generator = CardGenerator.new(suits, ranks)

    assert_equal true, card_generator.full_card_deck.empty?

    card_generator.make_standard_deck

    assert_equal 52, card_generator.full_card_deck.count
  end
end
