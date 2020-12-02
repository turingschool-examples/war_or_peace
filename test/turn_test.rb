require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class TurnTest < MiniTest::Test
  def setup_for_basic
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    @player1 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 10)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 13)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    @player2 = Player.new("Marisa", deck2)
    turn = Turn.new(@player1, @player2)
  end

  def setup_for_war
    @card7 = Card.new(:diamond, 'Queen', 12)
    @card8 = Card.new(:spade, '3', 3)
    @card9 = Card.new(:heart, 'King', 13)
    cards3 = [@card7, @card8, @card9]
    @deck3 = Deck.new(cards3)
    @player5 = Player.new("Jenny", @deck3)

    @card10 = Card.new(:diamond, '10', 12)
    @card11 = Card.new(:spade, '5', 5)
    @card12 = Card.new(:heart, 'Ace', 14)
    cards4 = [@card10, @card11, @card12]
    @deck4 = Deck.new(cards4)
    @player6 = Player.new("Marisa", @deck4)

    turn = Turn.new(@player5,@player6)
  end

  def setup_for_destruction
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck5 = Deck.new(@cards)
    @player3 = Player.new("Jenny", @deck5)

    @card4 = Card.new(:diamond, '10', 12)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 14)
    @cards2 = [@card4, @card5, @card6]
    @deck6 = Deck.new(@cards2)
    @player4 = Player.new("Marisa", @deck6)

    turn = Turn.new(@player3, @player4)
  end

  def test_it_exists
    turn = setup_for_basic

    assert_instance_of Turn, turn
  end

  def test_award_spoils_for_basic
    turn = setup_for_basic
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    award_array = [@card2, @card3, @card1, @card4]
    #assert_equal award_array, turn.winner.deck.cards
    assert_equal [@card5, @card6], turn.player2.deck.cards
  end

  def test_award_spoils_for_war
    turn = setup_for_war
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    award_array = [@card7, @card10, @card8, @card11, @card9, @card12]
    assert_equal award_array, turn.winner.deck.cards
    assert_equal [], @deck5
    assert_equal [], @deck6
  end

  def test_award_spoils_for_destruction
    turn = setup_for_destruction
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal [], turn.spoils_of_war
    assert_equal turn.player1.deck, @deck5
    assert_equal turn.player2.deck, @deck6
  end

  def test_sending_player_cards_to_spoil_of_war_for_basic
    turn = setup_for_basic
    turn.pile_cards
    assert_equal [@card1, @card4], turn.spoils_of_war
    assert_equal [@card2, @card3], @player1.deck.cards
    assert_equal [@card5, @card6], @player2.deck.cards
  end

  def test_sending_player_cards_to_spoil_of_war_for_war
    turn = setup_for_war
    turn.pile_cards
    pile_array = [@card7, @card10, @card8, @card11, @card9, @card12]
    assert_equal pile_array, turn.spoils_of_war
    assert_equal [], turn.player1.deck.cards
    assert_equal [], turn.player2.deck.cards
  end

  def test_pile_cards_for_destruction
    turn = setup_for_destruction
    turn.pile_cards
    assert_equal [], turn.spoils_of_war
    assert_equal [], turn.player1.deck.cards
    assert_equal [], turn.player2.deck.cards
  end

  def test_basic_type_of_turn
    turn = setup_for_basic
    assert_equal :basic, turn.type
  end

  def test_war_type_of_turn
    turn = setup_for_war
    assert_equal :war, turn.type
  end

  def test_mutally_assured_destruction_type_of_turn
    turn = setup_for_destruction
    assert_equal :mutally_assured_destruction, turn.type
  end

  def test_basic_winner_of_war
    turn = setup_for_basic
    assert_equal @player1, turn.winner
  end

  def test_mutally_assured_destruction_winner
    turn = setup_for_destruction
    assert_equal "No Winner", turn.winner
  end

  def test_war_winner
    turn = setup_for_war
    assert_equal @player6, turn.winner
  end
end
