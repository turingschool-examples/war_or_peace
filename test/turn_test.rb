require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

#
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
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    @winner = @turn.winner
    # binding.pry
  end
  # The Turn is responsible for much of the logic of the game and will respond to the following methods:
  #
  # initialize: A Turn is created with two players - player1 and player2
  # readable attributes for player1, player2, and spoils_of_war
  # type: a turn is :basic, :war, or :mutually_assured_destruction.
  # A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
  # A :war turn occurs when both players’ rank_of_card_at(0) are the same.
  # :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
  # winner: this method will determine the winner of the turn.
  # if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
  # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
  # if the turn has a type of :mutually_assured_destruction the method will return No Winner.
  # pile_cards: when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules
  # for a :basic turn, each player will send one card (the top card) to the spoils pile
  # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
  # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
  # award_spoils: this method will add each of the cards in the @spoils_of_war array to the winner of the turn.

  def test_it_exists
    setup

    assert_instance_of Turn, @turn
  end

  def test_it_has_players
    setup
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_it_has_spoils_of_war_empty_array
    setup
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_a_play_type
    setup
    assert_equal :basic, @turn.type
  end

  def test_the_winner_is_player1
    setup
    assert_equal @player1, @winner = @turn.winner
  end

  def test_it_can_return_cards_in_array_for_spoils_of_war
    setup
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
  end
end
