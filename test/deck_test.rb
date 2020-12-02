require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Jack', 11)
    @cards = [card_1, card_2]

    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_readable_attributes
    assert_equal @cards, @deck.cards
  end

  def test_rank_of_card_at
    # TODO (alex schwartz): which one of these is the better Expected param for this test?
    # assert_equal 12, @deck.rank_of_card_at(1)
    assert_equal @deck.cards.first.rank, @deck.rank_of_card_at(0)
  end
end
