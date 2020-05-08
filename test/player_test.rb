require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'


class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    @player
    assert_equal "Clarisa", @player.name
    assert_equal @deck, @player.deck
  end

  def test_has_lost
    refute @player.has_lost?
    @player.deck.remove_card
    refute @player.has_lost?
    @player.deck.remove_card
    refute @player.has_lost?
    @player.deck.remove_card
    assert @player.has_lost?
  end

  def test_no_cards
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    assert_equal [], @player.deck.cards
  end

end
