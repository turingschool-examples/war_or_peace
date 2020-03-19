require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require 'pry'

class DeckTest < Minitest::Test



  def test_does_it_exist
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    card_set = [card1, card2, card3]
    deck = Deck.new(card_set)
    assert_instance_of Deck, deck
  end


  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_set = [card1, card2, card3]

    deck = Deck.new(card_set)
    assert_equal card_set , deck.cards
  end

  def test_rank_of_card_at_location
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_set = [card1, card2, card3]

    deck = Deck.new (card_set)
    assert_equal 14, deck.rank_of_card_at(2)
end

def test_high_ranking_cards
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  card_set = [card1, card2, card3]

  deck = Deck.new(card_set)

  assert_equal [card1, card3],   deck.high_ranking_cards
end

def test_percent_high_ranking
  skip
  deck = Deck.new (card_set)
  deck.percent_high_ranking
  assert_equal "66%" , deck.percent_high_ranking
end

def test_remove_card
  skip
  deck = Deck.new (card_set)
  assert_equal ["card2","card3"] , deck.remove_card
end

def test_add_card
  skip
  deck = Deck.new (card_set)
  assert_equal ["card2","card3","card4"], deck.add_card
end


end
