require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_creator'
require 'pry'

class CardCreatorTest < Minitest:: Test
  def setup
    @all_suits = [:heart, :diamond, :spade, :club]
    @all_ranks = {
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
  end

  def test_it_exists
    @all_ranks
    @all_suits


    @card_creator = CardCreator.new(@all_ranks, @all_suits)

    assert_instance_of CardCreator, @card_creator
  end

  def test_can_read
    @all_ranks
    @all_suits


    @card_creator = CardCreator.new(@all_ranks, @all_suits)

    assert_equal @all_ranks, @card_creator.ranks
    assert_equal @all_suits, @card_creator.suits
    assert_equal [], @card_creator.full_deck
  end


  def test_create_deck
    @all_ranks
    @all_suits

    @card_creator = CardCreator.new(@all_ranks, @all_suits)

    assert_equal true, @card_creator.full_deck.empty?

    @card_creator.create_deck

    assert_equal 52, @card_creator.full_deck.count
  end
end
