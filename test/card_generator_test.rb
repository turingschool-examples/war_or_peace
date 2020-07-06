require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

require './lib/turn'

class CardGeneratorTest < Minitest::Test

  def setup
    @deck = CardGenerator.new.cards
  end

  def test_cards_exist
    assert_instance_of Card, @deck[0]
  end

  def test_number_of_cards
    assert_equal 52, @deck.count
  end

  def test_no_duplicates
    assert_equal nil, @deck.detect{ |e| @deck.count(e) > 1 }
  end

  def test_suit
    assert_equal "Heart", @deck[0].suit
  end

  def test_value
    assert_equal "2", @deck[0].value
  end

  def test_rank
    assert_equal 2, @deck[0].rank
  end

end
