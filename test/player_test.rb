require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class DeckTest < Minitest::Test

  def setup

    @card1 = Card.new('heart', '5', 5)
    @card2 = Card.new('spade', 'jack', 11)
    @card3 = Card.new('diamond', 'ace', 14)
    @cards1 = [@card1, @card2, @card3]
    @deck1 = Deck.new(@cards1)
    @player1 = Player.new('Megan', @deck1 )

    @card4 = Card.new('club', '5', 5)
    @card5 = Card.new('heart', 'king', 13)
    @card6 = Card.new('club', '8', 8)
    @cards2 = [@card4, @card5, @card6]
    @deck2 = Deck.new(@cards2)
    @deck3 = Deck.new([])
    @player2 = Player.new('Aurora', @deck2)
    @player3 = Player.new('Loser',@deck3)

  end

  def test_player_exists

    assert_instance_of Player, @player1

  end

  def test_player_has_deck

    assert_instance_of Deck, @player1.deck
    assert_equal 'spade', @player1.deck.cards[1].suit

  end

  def test_player_has_lost_initial

    assert_equal false, @player1.has_lost?
    assert_equal false, @player2.has_lost?
    assert_equal true, @player3.has_lost?

  end



end
