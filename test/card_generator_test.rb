require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/card'
require './lib/card_generator'


class CardGeneratorTest < Minitest::Test

  def setup
  end

  def test_it_can_make_full_deck
    file_name = './lib/cards.csv'
    cards = CardGenerator.new(file_name).cards

    assert_equal 52, cards.count
    assert_instance_of Card,
  end


end
