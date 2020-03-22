require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Jack', 11)
    @card3 = Card.new(:club, '4', 4)
    @card4 = Card.new(:heart, 'King', 13)
    @cards =[@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player1 = Player.new("Taylor", @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player1
  end

  def test_player_has_a_name
    assert_equal "Taylor", @player1.name
  end

  def test_player_can_have_a_different_name
    assert_equal "Gus", Player.new("Gus", @deck).name
  end

  def test_player_has_a_deck_of_cards
    assert_instance_of Deck, @player1.deck
  end

  def test_player_can_lose
    assert_equal false, @player1.has_lost?
    3.times do
      @player1.deck.remove_card
    end

    assert_equal true, @player1.has_lost?
  end
end
