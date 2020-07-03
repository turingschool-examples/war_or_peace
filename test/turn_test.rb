require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

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
    @player2 = Player.new('Aurora', @deck2)
    @turn = Turn.new(@player1, @player2)

  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_has_players
    assert_equal 'Aurora', @turn.player2.name
  end

  def test_turn_type
    assert_equal :war, @turn.type
  end

  def test_winner
    assert_equal 'Megan', @turn.winner.name
  end

  def test_pile_cards
    @turn.pile_cards
    assert_equal [@card1, @card2, @card3, @card4, @card5, @card6], @turn.spoils_of_war
  end

  def test_award_spoils
    victor = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(victor)
    assert_equal victor.deck.cards.count, 6
  end

end
