require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_can_prepare_deck
    @game.prepare_deck

    assert_equal 26, @game.deck1.cards.length
    assert_equal 26, @game.deck2.cards.length
  end

  def test_it_can_deal_cards
    @game.prepare_deck
    @game.deal_cards("Nick", "Arnold Schwarzenegger")

    assert_instance_of Player, @game.player1
    assert_instance_of Player, @game.player2
  end

  def test_turn_loop_works
    skip
    @game.prepare_deck
    @game.deal_cards("Nick", "Arnold Schwarzenegger")
    @game.turn_loop
  end

  def test_turn_loop_works_for_basic
    skip
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @game.deck1.cards << [@card1, @card2, @card5, @card8]
    @game.deck2.cards << [@card3, @card4, @card6, @card7]
    @game.deal_cards("Nick", @game.deck1)
    @game.deal_cards("Arnold Schwarzenegger", @game.deck2)
    @game.deck1.cards.flatten!
    @game.deck2.cards.flatten!

    assert_equal [], @game.turn_loop
  end

  def test_turn_loop_works_for_war

  end

  def test_turn_loop_works_for_mutually_assured_destruction

  end

  def test_start_starts_game
    @game.start("Nick", "Arnold Schwarzenegger")
  end
end
