require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'
require '../lib/player'
require '../lib/turn'

class RunTest < Minitest::Test
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
    @deck3 = Deck.new([@card1, @card2, @card5, @card8])
    @deck4 = Deck.new([@card1, @card4, @card6, @card7])
    @deck5 = Deck.new([@card1, @card2, @card5, @card8])
    @deck6 = Deck.new([@card1, @card4, @card5, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @player3 = Player.new("Megan", @deck3)
    @player4 = Player.new("Aurora", @deck4)
    @player5 = Player.new("Megan", @deck5)
    @player6 = Player.new("Aurora", @deck6)

    @turn = Turn.new(@player1, @player2)
    @turn1 = Turn.new(@player3, @player4)
    @turn2 = Turn.new(@player5, @player6)

  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn

    # @deck3 = Deck.new([@card1, @card2, @card5, @card8])
    # @deck4 = Deck.new([@card1, @card4, @card6, @card7])
    # @deck5 = Deck.new([@card1, @card2, @card5, @card8])
    # @deck6 = Deck.new([@card1, @card4, @card5, @card7])

    # @player3 = Player.new("Megan", @deck3)
    # @player4 = Player.new("Aurora", @deck4)
    # @player5 = Player.new("Megan", @deck5)
    # @player6 = Player.new("Aurora", @deck6)

    # @turn = Turn.new(@player1, @player2)
    # @turn1 = Turn.new(@player3, @player4)
    # @turn2 = Turn.new(@player5, @player6)

    assert_equal :basic, @turn.type
    assert_equal :war, @turn1.type
    assert_equal :mutually_assured_destruction, @turn2.type
  end

  def test_basic_turn_winner
    assert_equal @player1, @turn.winner
  end

  def test_war_turn_winner

    deck3 = Deck.new([@card1, @card2, @card5, @card8])
    deck4 = Deck.new([@card1, @card4, @card6, @card7])
    player3 = Player.new("Megan", deck3)
    player4 = Player.new("Aurora", deck4)
    turn1 = Turn.new(player3, player4)
    assert_equal player4, turn1.winner
  end

  def test_mutually_assured_destruction_winner

    deck5 = Deck.new([@card1, @card2, @card5, @card8])
    deck6 = Deck.new([@card1, @card4, @card5, @card7])
    player5 = Player.new("Megan", deck5)
    player6 = Player.new("Aurora", deck6)
    turn2 = Turn.new(player5, player6)
    assert_equal 'No Winner', turn2.winner
  end

  def test_spoils_of_war__basic_turn
    @turn.pile_cards
    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_spoils_of_war__war_turn
    @turn1.pile_cards
    assert_equal [@card1, @card2, @card5, @card1, @card4, @card6] , @turn1.spoils_of_war
  end

  def test_spoils_of_war__mutually_assured_destruction_turn
    @turn2.pile_cards
    assert_equal [], @turn2.spoils_of_war
  end

  # def test_cards_in_hand_adjusted_for_turn
  #
  #   assert_equal [], turn.remove_played_cards_from_hand
  # end

  def test_award_spoils_to_winner__basic
    # @card1 = Card.new(:heart, 'Jack', 11)
    # @card2 = Card.new(:heart, '10', 10)
    # @card3 = Card.new(:heart, '9', 9)
    # @card4 = Card.new(:diamond, 'Jack', 11)
    # @card5 = Card.new(:heart, '8', 8)
    # @card6 = Card.new(:diamond, 'Queen', 12)
    # @card7 = Card.new(:heart, '3', 3)
    # @card8 = Card.new(:diamond, '2', 2)

    # @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    # @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    # @player1 = Player.new("Megan", @deck1)
    # @player2 = Player.new("Aurora", @deck2)
    # @turn = Turn.new(@player1, @player2)

    @turn.pile_cards
    assert_equal [@card4,@card6, @card7], @turn.award_spoils
  end

  def test_award_spoils_to_winner__war
    # deck3 = Deck.new([@card1, @card2, @card5, @card8])
    # deck4 = Deck.new([@card1, @card4, @card6, @card7])
    # player3 = Player.new("Megan", deck3)
    # player4 = Player.new("Aurora", deck4)
    # turn1 = Turn.new(player3, player4)

    @turn1.pile_cards
    assert_equal [@card7, @card1, @card2, @card5, @card1, @card4 ,@card6], @turn1.award_spoils
  end
end
