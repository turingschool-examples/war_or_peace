require './lib/deck'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'


class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_has_attributes

    assert_equal @cards, @deck.cards
  end

  def test_high_ranking_cards
    high_ranking_cards = [@card1, @card3]

    assert_equal high_ranking_cards, @deck.high_ranking_cards
  end

  def test_percent_high_ranking
    high_ranking_cards = [@card1, @card3]
    percent_high = (high_ranking_cards.count.to_f.round(2) / @cards.count.to_f.round(2)) * 100

    assert_equal percent_high, @deck.percent_high_ranking
  end

  def test_rank_of_card_at
    @card1.rank == 12

    assert_equal @card1.rank, @deck.rank_of_card_at(0)
  end

  def test_remove_card
    remove_card = @card1

    assert_equal remove_card, @deck.remove_card
  end

  def test_add_card
    card4 = Card.new(:club, '5', 5)
    @cards << card4

    assert_equal @cards, @deck.add_card(card4)
  end

end
