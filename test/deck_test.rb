require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest :: Tes

  def test_it_exists
    deck = Deck.new
    assert_instance_of Deck, deck
  end

  def test_it_has_rank_of_cards_at
    deck = Deck.new[index]
    assert_equal @cards[index].rank, rank_of_card_at
  end

  def test_high_ranking_cards
    deck = Deck.new
    assert_equal high_cards, deck.high_ranking_cards
  end

  # def test_percent_of_high_ranking
  #   deck = Deck.new
  #   assert_equal
  # end

  def card_can_be_removed
    deck = Deck.new
    assert_equal (@cards - 1), @cards.shift
  end

  def card_can_be_added
    deck = Deck.new
    assert_equal (@cards + 1), @cards.push
  end 
