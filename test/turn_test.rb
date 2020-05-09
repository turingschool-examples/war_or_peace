require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class DeckTest < Minitest::Test

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
    @turn_type = @turn.type
    @spoils_of_war = @turn.spoils_of_war
    @winner = @turn.winner
  end

# -------Basic Tests Below ---------

  def test_it_can_return_player_names_basic
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_spoils_basic
    assert_equal [], @turn.spoils_of_war
  end

  def test_type_is_basic
    skip
    assert_equal :basic, @turn.type
  end

  def test_if_is_winner_basic
    # skip to test M.A.D.
    skip
    assert_equal @player1, @turn.winner
  end

  def test_if_pile_cards_functions_basic
    # skip to test M.A.D.
    skip
    @turn_type = @turn.type
    assert_empty @spoils_of_war
    @turn.pile_cards
    refute_empty @spoils_of_war
  end

  def test_if_spoils_are_given_to_winner_basic
    @turn.pile_cards
    @turn.spoils_of_war
    @turn.award_spoils(@winner)
    @spoils_of_war = @turn.spoils_of_war
    assert_empty @spoils_of_war
    assert_equal @player1.deck, @winner.deck
  end

# -------War Tests Below ---------

  def test_it_can_return_player_names_war
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_spoils_war
    assert_equal [], @turn.spoils_of_war
  end

  def test_type_is_war
    # skip to test M.A.D.
    skip
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    assert_equal :war, @turn.type
  end

  def test_if_is_winner_war
    skip
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    # binding.pry
    assert_equal @player2, @turn.winner
  end

  def test_if_pile_cards_functions_war
    # skip to test M.A.D.
    skip
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    assert_empty @spoils_of_war
    @turn.pile_cards
    @spoils_of_war = @turn.spoils_of_war
    refute_empty @spoils_of_war
  end

  def test_if_spoils_are_given_to_winner_war
    skip
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    @turn.spoils_of_war
    @winner = @turn.winner
    assert_empty @spoils_of_war
    assert_equal @player2.deck, @winner.deck
  end

# -------M.A.D. Tests Below ---------

  def test_it_can_return_player_names_mad
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_spoils_mad
    assert_equal [], @turn.spoils_of_war
  end

  def test_type_is_mad
    # skip to test M.A.D.
    skip
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
    assert_equal :war, @turn.type
  end

  def test_if_is_winner_mad
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
    # binding.pry
    assert_equal "No Winner", @turn.winner
  end

  def test_if_pile_cards_functions_mad
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
    @spoils_of_war = @turn.spoils_of_war
    assert_empty @spoils_of_war
    @turn.type
    @turn.winner
    @turn.pile_cards
    assert_empty @spoils_of_war
  end

  def test_if_spoils_are_empty_mad

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    @turn.spoils_of_war
    @winner = @turn.winner
    assert_empty @turn.spoils_of_war
  end

end
