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
    @deck1 = Deck.new([@card1, @card2, @card3])
    @player1 = Player.new('Megan', @deck1 )

    @card4 = Card.new('club', '5', 5)
    @card5 = Card.new('heart', 'king', 13)
    @card6 = Card.new('club', '8', 8)
    @deck2 = Deck.new([@card4, @card5, @card6])
    @player2 = Player.new('Aurora', @deck2)

  end

  def test_player_exists

    assert_instance_of Player, @player1

  end
  #
  # def test_player_has_cards
  #   assert_equal 'diamond', @player1.deck.cards[3].suit
  # end

  # def player_has_lost
  #   assert_equal 'false', player.has_lost?
  # end

end
