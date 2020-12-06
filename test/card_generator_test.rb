require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require '.lib/card'
require '.lib/card_generator'


class CardGeneratorTest < Minitest::Test

  def setup
    file_name = 'card.csv'
    cards = CardGenerator.new(file_name).cards

    assert_equal 52, cards.length
  end
end
