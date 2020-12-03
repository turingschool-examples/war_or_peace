require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require 'pry'

class TurnTest < MiniTest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player1 = Player.new("Jenny", @deck)

    @card4 = Card.new(:diamond, '10', 10)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 13)
    @cards2 = [@card4, @card5, @card6]
    @deck2 = Deck.new(@cards2)
    @player2 = Player.new("Marisa", @deck2)
    @turn_basic = Turn.new(@player1, @player2)

    @card7 = Card.new(:diamond, 'Queen', 12)
    @card8 = Card.new(:spade, '3', 3)
    @card9 = Card.new(:heart, 'King', 13)
    @cards3 = [@card7, @card8, @card9]
    @deck3 = Deck.new(@cards3)
    @player3 = Player.new("Jenny", @deck3)

    @card10 = Card.new(:diamond, 'Queen', 12)
    @card11 = Card.new(:spade, '5', 5)
    @card12 = Card.new(:heart, 'Ace', 14)
    @cards4 = [@card10, @card11, @card12]
    @deck4 = Deck.new(@cards4)
    @player4 = Player.new("Marisa", @deck4)

    @turn_war = Turn.new(@player3, @player4)

    @card13 = Card.new(:diamond, 'Queen', 12)
    @card14 = Card.new(:spade, '3', 3)
    @card15 = Card.new(:heart, 'Ace', 14)
    @cards5 = [@card13, @card14, @card15]
    @deck5 = Deck.new(@cards5)
    @player5 = Player.new("Jenny", @deck5)

    @card16 = Card.new(:diamond, '10', 12)
    @card17 = Card.new(:spade, '5', 5)
    @card18 = Card.new(:heart, 'King', 14)
    @cards6 = [@card16, @card17, @card18]
    @deck6 = Deck.new(@cards6)
    @player6 = Player.new("Marisa", @deck6)

    @turn_destruction = Turn.new(@player5, @player6)
  end

  def test_it_exists
    assert_instance_of Turn, @turn_basic
  end

  def test_award_spoils_for_basic
    winner = @turn_basic.winner
    @turn_basic.pile_cards
    @turn_basic.award_spoils(winner)
    award_array = [@card2, @card3, @card1, @card4]
    assert_equal award_array, winner.deck.cards
    assert_equal [@card5, @card6], @turn_basic.player2.deck.cards
  end

  def test_award_spoils_for_war
    winner = @turn_war.winner
    @turn_war.pile_cards
    @turn_war.award_spoils(winner)
    award_array = [@card7, @card10, @card8, @card11, @card9, @card12]
    assert_equal award_array, winner.deck.cards
    assert_equal [], @deck3.cards
  end

  def test_award_spoils_for_destruction
    winner = @turn_destruction.winner
    @turn_destruction.pile_cards
    @turn_destruction.award_spoils(winner)

    assert_equal [], @turn_destruction.spoils_of_war
    assert_equal @turn_destruction.player1.deck, @deck5
    assert_equal @turn_destruction.player2.deck, @deck6
  end

  def test_sending_player_cards_to_spoil_of_war_for_basic
    @turn_basic.pile_cards
    assert_equal [@card1, @card4], @turn_basic.spoils_of_war
    assert_equal [@card2, @card3], @player1.deck.cards
    assert_equal [@card5, @card6], @player2.deck.cards
  end

  def test_basic_pile
    @turn_basic.basic_pile
    assert_equal [@card1, @card4], @turn_basic.spoils_of_war
    assert_equal [@card2, @card3], @player1.deck.cards
    assert_equal [@card5, @card6], @player2.deck.cards
  end

  def test_sending_player_cards_to_spoil_of_war_for_war
    @turn_war.pile_cards
    pile_array = [@card7, @card10, @card8, @card11, @card9, @card12]
    assert_equal pile_array, @turn_war.spoils_of_war
    assert_equal [], @turn_war.player1.deck.cards
    assert_equal [], @turn_war.player2.deck.cards
  end

  def test_war_pile
    @turn_war.war_pile
    pile_array = [@card7, @card10, @card8, @card11, @card9, @card12]
    assert_equal pile_array, @turn_war.spoils_of_war
    assert_equal [], @turn_war.player1.deck.cards
    assert_equal [], @turn_war.player2.deck.cards
  end

  def test_pile_cards_for_destruction
    @turn_destruction.pile_cards
    assert_equal [], @turn_destruction.spoils_of_war
    assert_equal [], @turn_destruction.player1.deck.cards
    assert_equal [], @turn_destruction.player2.deck.cards
  end

  def test_destruction_pile
    @turn_destruction.destruction_pile
    assert_equal [], @turn_destruction.spoils_of_war
    assert_equal [], @turn_destruction.player1.deck.cards
    assert_equal [], @turn_destruction.player2.deck.cards
  end

  def test_basic_type_of_turn
    assert_equal :basic, @turn_basic.type
  end

  def test_war_type_of_turn
    assert_equal :war, @turn_war.type
  end

  def test_mutally_assured_destruction_type_of_turn
    assert_equal :mutally_assured_destruction, @turn_destruction.type
  end

  def test_get_player_ranks
    @turn_basic.get_ranks
    assert_equal @card1.rank, @turn_basic.player_1_rank_0
    assert_equal @card3.rank, @turn_basic.player_1_rank_2
    assert_equal @card4.rank, @turn_basic.player_2_rank_0
    assert_equal @card6.rank, @turn_basic.player_2_rank_2
  end
  def test_basic_winner_of_war
    assert_equal @player1, @turn_basic.winner
  end

  def test_mutally_assured_destruction_winner
    assert_equal "No Winner", @turn_destruction.winner
  end

  def test_war_winner
    assert_equal @player4, @turn_war.winner
  end
end
