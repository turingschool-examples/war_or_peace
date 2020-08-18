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
      rank >= 11
  end

  def test_remove_card
    deck = Deck.new[2..14]
    deck.push

    #or should remove_card be the method?
  end

  def test_add_card(card)
    @deck << card

    @deck + 1
  end

end
