require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @queen_of_hearts = Card.new(:heart, 'Queen', 12)
    @queen_of_diamonds = Card.new(:diamond, 'Queen', 12)
    @queen_of_spades = Card.new(:spade, 'Queen', 12)
    @queen_of_clubs = Card.new(:club, 'Queen', 12)
    @ten_of_diamonds = Card.new(:diamond, '10', 10)
    @five_of_clubs = Card.new(:club, '5', 5)
  end

  def test_it_exists
    margaret = Player.new('Margaret', Deck.new([]))
    jose = Player.new('Jose', Deck.new([]))

    turn = Turn.new(margaret, jose)

    assert_instance_of(Turn, turn)
  end

  def test_it_has_readable_attributes
    margaret = Player.new('Margaret', Deck.new([]))
    jose = Player.new('Jose', Deck.new([]))

    turn = Turn.new(margaret, jose)

    # player1
    assert_equal margaret, turn.player1
    # player2
    assert_equal jose, turn.player2
    # spoils_of_war
    assert_equal [], turn.spoils_of_war
  end

  def test_type_basic
    # Each player's card at index 0 is not the same
    margaret_deck = Deck.new([@queen_of_hearts])
    jose_deck = Deck.new([@ten_of_diamonds])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    basic_turn = Turn.new(margaret, jose)

    assert_equal :basic, basic_turn.type
  end

  def test_type_war
    # Each player's card at index 0 is the same

    margaret_deck = Deck.new([@queen_of_hearts])
    jose_deck = Deck.new([@queen_of_spades])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    war_turn = Turn.new(margaret, jose)

    assert_equal :war, war_turn.type
  end

  def test_type_mutually_assured_destruction
    # Each player's card at index 0 is the same and their cards at index 2 are also the same

    margaret_deck = Deck.new([@queen_of_hearts, @ten_of_diamonds, @queen_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    mutually_assured_destruction_turn = Turn.new(margaret, jose)

    assert_equal :mutually_assured_destruction, mutually_assured_destruction_turn.type
  end

  def test_winner_basic
    # Returns whichever player has the higher card at index 0

    margaret_deck = Deck.new([@queen_of_hearts])
    jose_deck = Deck.new([@ten_of_diamonds])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    basic_turn = Turn.new(margaret, jose)

    assert_equal margaret, basic_turn.winner
  end

  def test_winner_war
    # Returns whichever player has the higher card at index 2

    margaret_deck = Deck.new([@queen_of_hearts, @queen_of_diamonds, @ten_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    war_turn = Turn.new(margaret, jose)

    assert_equal jose, war_turn.winner
  end

  def test_winner_mutually_assured_destruction
    # Returns "No Winner"

    margaret_deck = Deck.new([@queen_of_hearts, @ten_of_diamonds, @queen_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    mutually_assured_destruction_turn = Turn.new(margaret, jose)

    assert_equal "No Winner", mutually_assured_destruction_turn.winner
  end

  def test_cards_used
    margaret_deck = Deck.new([@queen_of_hearts, @queen_of_diamonds, @ten_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    war_turn = Turn.new(margaret, jose)
    war_turn.pile_cards
    war_turn.award_spoils(war_turn.winner)

    assert_equal 6, war_turn.cards_used
  end

  def test_pile_cards_basic
    margaret_deck = Deck.new([@queen_of_hearts])
    jose_deck = Deck.new([@ten_of_diamonds])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    basic_turn = Turn.new(margaret, jose)
    basic_turn.pile_cards

    # Assert that spoils_of_war is filled and that each players Deck removed the cards
    assert_equal 2, basic_turn.spoils_of_war.length
    assert_includes basic_turn.spoils_of_war, @queen_of_hearts
    assert_includes basic_turn.spoils_of_war, @ten_of_diamonds
    assert_equal [], margaret.deck.cards
    assert_equal [], jose.deck.cards
  end

  def test_pile_cards_war
    margaret_deck = Deck.new([@queen_of_hearts, @queen_of_diamonds, @ten_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    war_turn = Turn.new(margaret, jose)
    war_turn.pile_cards

    assert_equal 6, war_turn.spoils_of_war.length
    assert_includes war_turn.spoils_of_war, @queen_of_hearts
    assert_includes war_turn.spoils_of_war, @queen_of_spades
    assert_includes war_turn.spoils_of_war, @queen_of_diamonds
    assert_includes war_turn.spoils_of_war, @five_of_clubs
    assert_includes war_turn.spoils_of_war, @ten_of_diamonds
    assert_includes war_turn.spoils_of_war, @queen_of_clubs
    assert_equal [], margaret.deck.cards
    assert_equal [], jose.deck.cards
  end

  def test_pile_cards_mutually_assured_destruction
    margaret_deck = Deck.new([@queen_of_hearts, @ten_of_diamonds, @queen_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    mutually_assured_destruction_turn = Turn.new(margaret, jose)
    mutually_assured_destruction_turn.pile_cards

    assert_equal [], mutually_assured_destruction_turn.spoils_of_war
    assert_equal [], margaret.deck.cards
    assert_equal [], jose.deck.cards
  end

  def test_award_spoils_has_winner
    margaret_deck = Deck.new([@queen_of_hearts])
    jose_deck = Deck.new([@ten_of_diamonds])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    turn = Turn.new(margaret, jose)
    winner = turn.winner
    turn.pile_cards
    spoils_copy = turn.spoils_of_war

    # award_spoils
    turn.award_spoils(winner)

    # assert winner's deck now includes spoils
    spoils_copy.each do |card|
      assert_includes winner.deck.cards, card
    end
  end

  def test_award_spoils_no_winner
    margaret_deck = Deck.new([@queen_of_hearts, @ten_of_diamonds, @queen_of_diamonds])
    jose_deck = Deck.new([@queen_of_spades, @five_of_clubs, @queen_of_clubs])

    margaret = Player.new('Margaret', margaret_deck)
    jose = Player.new('Jose', jose_deck)

    turn = Turn.new(margaret, jose)
    winner = turn.winner
    turn.pile_cards
    spoils_copy = turn.spoils_of_war

    turn.award_spoils(winner)

    # Not sure what to assert here... wanting to make sure the method runs w/o throwing any errors.
  end
end
