require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class PlayerTurn < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck1 = Deck.new(cards)
    deck2 = Deck.new(cards)
    name = name
    player = Player.new('Clarisa', deck)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  # def test_type
  # end
  #
  # def test_winner
  # end
  #
  # def test_pile_cards
  # end
  #
  # def test_award_spoils
  # end



end
