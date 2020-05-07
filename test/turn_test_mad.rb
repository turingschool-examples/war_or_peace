require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTestMutuallyAssuredDestruction < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_turn_type_can_be_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn.type
  end

  def test_there_can_be_no_winner
    assert_equal "No Winner", @turn.winner
  end

  def test_if_spoils_of_war_is_empty_after_cards_piled_and_decks_have_shrunk
    @turn.pile_cards

    assert_equal [], @turn.spoils_of_war

    assert_equal [@card8], @player1.deck.cards
    assert_equal [@card7], @player2.deck.cards
  end

end
