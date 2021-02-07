require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:heart, 'Ace', 14)
    @card10 = Card.new(:spade, 'Ace', 14)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8, @card9])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7, @card10])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end
  def test_it_exists
    assert_instance_of Turn, @turn
    assert_equal [], @turn.spoils_of_war
  end

  def test_turn_type
    assert_equal :basic, @turn.type
  end

  def test_turn_winner
    assert_equal @player1, @turn.winner
  end

  def test_turn_pile_cards
    @turn.pile_cards
    expected = [@card1, @card3]
    assert_equal expected, @turn.spoils_of_war
  end

  def test_it_can_award_spoils_of_war
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    assert_equal 6, @player1.deck.cards.length
    assert_equal 4, @player2.deck.cards.length
  end

  def test_turn_type
    @turn.pile_cards
    @turn.pile_cards
    @turn.pile_cards
    @turn.pile_cards
    assert_equal :war, @turn.type
  end

  def test_turn_winner
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    assert_equal @player2, @turn.winner
  end

  def test_turn_type
    @turn.pile_cards
    @turn.pile_cards
    @turn.pile_cards
    @turn.pile_cards
    assert_equal :mutually_assured_destruction, @turn.type
  end

end
