require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player1 = Player.new('Clarisa', @deck)
  end

  def test_player_has_a_name
    assert_equal 'Clarisa', @player1.name
  end

  def test_player_has_a_deck
    assert_equal @deck, @player1.deck
  end

  def test_player_default_value_of_has_lost_is_false
    refute @player1.has_lost?, @player1.has_lost?
  end

  def test_player_can_remove_card_from_deck
    @player1.deck.remove_card
    assert_equal [@card2, @card3], @player1.deck.cards
  end

  def test_player_loses_if_they_have_no_cards
    @player1.deck.remove_card
    @player1.deck.remove_card
    @player1.deck.remove_card
    assert @player1.has_lost?, @player1.has_lost?
  end

  def test_player_has_empty_deck_after_removing_cards
    @player1.deck.remove_card
    @player1.deck.remove_card
    @player1.deck.remove_card
    assert [], @player1.deck.cards
  end

end
