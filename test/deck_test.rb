require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @deck1 = Deck.new([@card3, @card2, @card1,@card6, @card5, @card4])
  end

  def test_it_exists
    assert_instance_of Deck, @deck1
  end

  def test_rank
    i = 0
    test_deck = [@card3, @card2, @card1,@card6, @card5, @card4]
    while i < @deck1.cards.length 
        assert_equal @deck1.cards[i].rank, test_deck[i].rank
        i += 1
    end
  end
  def test_high_cards
    assert_equal [@card3, @card1, @card6, @card4], @deck1.high_ranking_cards
  end
  def test_percent
    if @deck1.cards.length < 7
        assert_equal 66.67, @deck1.percent_high_ranking
    else 
        assert_equal (5.0/7).round(2), @deck1.percent_high_ranking
  end
  def test_remove
    @deck1.remove_card
    assert_equal @deck1.cards,  [@card3, @card2, @card1,@card6, @card5]
  end
  def test_add
    @deck1.add_card(@card1)
    assert_equal @deck1, [@card3, @card2, @card1,@card6, @card5, @card4,@card1]
  end
end
end
