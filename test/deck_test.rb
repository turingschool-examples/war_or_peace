require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup

    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new()

  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_it_starts_with_an_empty_array


    assert_equal [], @deck.cards
  end

  def test_it_can_read_rank_of_card_at

    deck = Deck.new(@card1, @card2, @card3)

    assert_equal 12, deck.cards[0].rank
    assert_equal 3, deck.cards[1].rank
    assert_equal 14, deck.cards.last.rank
  end

  def test_rank_of_card_at

    deck = Deck.new(@card1, @card2, @card3)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_finds_high_ranking_cards

    deck = Deck.new(@card1, @card2, @card3)



    assert_equal [@card1, @card3], deck.high_ranking_cards
  end

  #this is a change for test_branch

end
