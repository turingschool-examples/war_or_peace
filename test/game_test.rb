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
  @cards = @game.cards
  @deck = Deck.new(@cards)
  @player1 = Player.new('Clarisa', @deck)
  @player2 = Player.new('Dom', @deck)
  end

  def test_it_exists_with_attributes
    assert_instance_of Game, @game

    expected1 = [:heart, :diamond, :club, :spade]
    expected2 = {
                  "Ace" => 1, "2" =>  2, "3" => 3, "4"=> 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8,
                  "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13
                }

    assert_equal [], @cards
    assert_equal expected1, @game.suits
    assert_equal expected2, @game.values
  end

  def test_it_creates_cards
    @game.create_cards
    
    assert_equal 52, @cards.length
  end

  def test_deck_is_shuffled
    @game.create_cards
    @game.shuffle

    assert_instance_of Card, @cards[0]
  end

  def test_it_makes_player_decks
    @game.create_cards
    @game.shuffle
    @game.split_cards

    assert_equal 26, @game.player1.deck.cards.length
    assert_equal 26, @game.player2.deck.cards.length
  end
end
