require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def setup
  @game = Game.new
  @player1 = Player.new('Clarisa', @game.deck)
  @player2 = Player.new('Dom', @game.deck)
  end

  def test_it_exists_with_attributes
    assert_instance_of Game, @game

    expected1 = [:heart, :diamond, :club, :spade]
    expected2 = {
                  "Ace" => 1, "2" =>  2, "3" => 3, "4"=> 4, "5" => 5, "6" => 6, "7" => 7, "8" => 9,
                  "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13
                }

    assert_equal [], @game.deck
    assert_equal expected1, @game.suits
    assert_equal expected2, @game.values
  end

  def test_it_creates_new_deck
    @game.create_new_deck

    assert_equal 52, @game.deck.length
  end

  def test_deck_is_shuffled
    @game.create_new_deck
    @game.shuffle

    assert_instance_of Card, @game.deck[0]
  end

  def test_it_makes_player_decks
    assert_equal 26, @player1.deck.count
    assert_equal 26, @player2.deck.count
  end
end
