require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    # General Setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    # Bacic Turn
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)

    # War Turn
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    @player3 = Player.new("Harry", deck3)

    # Mutually Assured Destruction (MAD) Turn
    @card9 = Card.new(:diamond, '8', 8)
    deck4 = Deck.new([@card4, @card3, @card9, @card7])
    @player4 = Player.new("Charles", deck4)

  end

  def test_it_exists
    turn = Turn.new(@player1, @player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_players
    turn = Turn.new(@player1, @player2)

    assert_instance_of Player, turn.player1
    assert_instance_of Player, turn.player2
  end

  def test_it_has_spoils_of_war
    turn = Turn.new(@player1, @player2)

    assert_equal [], turn.spoils_of_war
  end

  # Basic Turn Tests

  def test_it_has_a_type_basic
    turn = Turn.new(@player1, @player2)

    assert_equal :basic, turn.type
  end

  def test_it_has_a_winner_basic
    turn = Turn.new(@player1, @player2)

    assert_equal @player1, turn.winner
  end

  def test_it_piles_the_cards_basic
    turn = Turn.new(@player1, @player2)

    turn.pile_cards

    assert_equal [@card1, @card3], turn.spoils_of_war
  end

  # War Turn Tests

  def test_it_has_a_type_war
    turn = Turn.new(@player1, @player3)

    assert_equal :war, turn.type
  end

  def test_it_has_a_winner_war
    turn = Turn.new(@player1, @player3)

    assert_equal @player3, turn.winner
  end

  # QUESTION: Can I make this assertion order independent?
  # Wanted to use assert_includes (can it be used for multiple objs?)
  def test_it_piles_the_cards_war
    turn = Turn.new(@player1, @player3)

    turn.pile_cards

    assert_equal [@card1, @card4, @card2, @card3, @card5, @card6], turn.spoils_of_war
  end

  # Mutually assured destruction tests

  def test_it_has_a_type_MAD
    turn = Turn.new(@player1, @player4)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_has_a_winner_MAD
    turn = Turn.new(@player1, @player4)

    assert_equal "No Winner", turn.winner
  end

  def test_it_piles_the_cards_and_doesnt_add_them_to_spoils_of_war
    turn = Turn.new(@player1, @player4)

    turn.pile_cards

    assert_equal true, turn.spoils_of_war.empty?
  end

  # QUESTION: do i need to test this for each turn type & each player?
  # Edge cases when there are less than 3 cards in the deck. Accounted for
  # this in start method instead
  def test_it_removes_the_piled_cards
    turn = Turn.new(@player1, @player2)

    turn.pile_cards

    assert_equal [@card2, @card5, @card8], @player1.deck.cards
  end

  def test_it_awards_the_spoils
    turn = Turn.new(@player1, @player2)

    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 5, @player1.deck.cards.length
  end
end
