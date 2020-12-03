require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

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
  end

  def test_it_exists
    assert_instance_of Turn, @turn 

    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2

    assert_equal [], @turn.spoils_of_war
  end

  def test_turn_type_basic
    assert_equal :basic, @turn.type
  end

  def test_which_player_wins_turn
    assert_equal @player1, @winner
  end

  def test_if_it_piles_cards_in_spoils_of_war
    @turn.pile_cards
    assert_equal [@card1,@card3], @turn.spoils_of_war
  end

  def test_it_gives_spoils_to_winner
    @turn.pile_cards
    @turn.award_spoils(@winner)

    assert_equal @player1.deck, @player1.deck
    assert_equal @player2.deck, @player2.deck
  end

  def test_turn_type_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

    assert_equal :war, turn.type
  end
  
  def test_which_player_wins_turn_war_type
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

    assert_equal player2, winner
  end

  def test_if_it_piles_cards_in_spoils_of_war_type_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner

    turn.pile_cards

    expected = [@card1,@card4,@card2,@card3,@card5,@card6]
    assert_equal expected, turn.spoils_of_war
  end
end