require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

card_set

  def test_does_it_exist
    deck = Deck.new (card_set)
    assert_instance_of Deck, deck
  end


  def test_it_has_readable_attributes
    deck = Deck.new (card_set)
    assert_equal card_set , deck.cards
  end

  def test_rank_of_card_at_location
    deck = Deck.new (card_set)
    assert_equal @rank, deck.rank_of_card_at(index)
end

def test_high_ranking_cards
  deck = Deck.new (card_set)
  assert_equal ["card1","card3"], eleven_deck.high_ranking_cards
end

def test_percent_high_ranking
  deck = Deck.new (card_set)
  deck.percent_high_ranking
  assert_equal "66%" , deck.percent_high_ranking
end

def test_remove_card
  deck = Deck.new (card_set)
  assert_equal ["card2","card3"] , deck.remove_card
end

def test_add_card
  deck = Deck.new (card_set)
  assert_equal["card2","card3","card4"], deck.add_card
end


end
