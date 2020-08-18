require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    cards = Deck.new[2..14]
  end

  def test_it_exists
    deck = Deck.new[2..14]

    assert_instance_of Deck, deck
  end

  def test_rank_of_card_at
    deck = Deck.new[2..14]
    rank = []
    deck.each do |num|
      rank << num.index
  end

  def test_high_ranking_cards
    deck = Deck.new[2..14]
    deck.find_all do |rank|
      rank.count >= 11
  end

  def test_remove_card
    deck = Deck.new[2..14]
    deck.push
  end

  def test_add_card
    deck = Deck.new[2..14]

    assert deck.add_card
  end

end

p rank(0)
p test_high_ranking_cards
p test_remove_card
p test_add_card
