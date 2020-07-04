require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# require './war_or_peace_runner'
require './lib/card_generator'
require "pry"

class CardGeneratorTest < Minitest::Test
  def test_read_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    deck = cards.read_file
    assert_equal 52, deck.size
  end

  def test_deck_creation
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    created_cards = cards.create_cards
    assert_equal 52, created_cards.size
  end
end
