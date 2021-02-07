require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_game_exists
    # skip
    game = Game.new(player1=nil, player2=nil)

    assert_instance_of Game, game
  end

  def test_game_start
    skip

    suits = [:spades, :hearts, :diamonds, :clubs]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    full_deck = []

    suits.each do |suit|
      values.size.times {|r| full_deck << Card.new( suit, values[r], r+2 )}
    end

    full_deck = full_deck.shuffle.shuffle
    deck1 = Deck.new([])
    deck2 = Deck.new([])

    player1 = Player.new('Meagan', deck1)
    player2 = Player.new('Aurora', deck2)
    # turn = Turn.new(player1, player2)


    26.times do |index|
      player1.deck.cards << full_deck.shift
      player2.deck.cards << full_deck.shift
    end

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
    assert_equal [], turn.spoils_of_war

    winner = turn.winner

    assert_equal :basic, turn.type
    assert_equal player1, turn.winner

    turn.pile_cards

    assert_equal [card1,card3], turn.spoils_of_war

    turn.award_spoils(winner)
    assert_equal 5, turn.player1.deck.cards.size
    assert_equal 3, turn.player2.deck.cards.size

    assert_equal [card2,card5,card8,card1,card3], turn.player1.deck.cards
    assert_equal [card4,card6,card7], turn.player2.deck.cards
  end

end
