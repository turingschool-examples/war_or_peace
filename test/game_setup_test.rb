require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_setup'
require 'pry'

class GameSetupTest < Minitest::Test

  def setup
    @game_setup = GameSetup.new
  end

  def test_it_exists
    assert_instance_of GameSetup, @game_setup
  end

  def test_make_standard_deck
    52.times do |card|
      assert_instance_of Card, @game_setup.make_standard_deck[card]
    end
    suit_and_rank = @game_setup.make_standard_deck.map { |card| [card.suit, card.value, card.rank]  }

    assert_equal suit_and_rank, suit_and_rank.uniq
  end

  def test_make_player_decks
    decks = @game_setup.make_player_decks
    player1_deck = decks[0]
    player2_deck = decks[1]

    assert_instance_of Deck, player1_deck
    assert_instance_of Deck, player2_deck

    assert_equal 26, player1_deck.cards.length
    assert_equal 26, player2_deck.cards.length

    player1_deck_ranks = player1_deck.map { |card| card.rank }
    player2_deck_ranks = player2_deck.map { |card| card.rank }

    assert_equal false, player1_deck_ranks == player2_deck_ranks
  end

  def test_make_players
    assert_instance_of Player, @game_setup.make_players[0]
    assert_instance_of Player, @game_setup.make_players[1]
  end

end
