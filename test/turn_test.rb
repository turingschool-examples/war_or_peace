require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class PlayerTest < Minitest::Test
  def setup
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:spades, "Ace", 13)
    card3 = Card.new(:heart, 'Nine', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, 'Eight', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, 'Three', 3)
    card8 = Card.new(:diamond, 'Two', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)
  end

  def test_it_exists
    turn = Turn.new(@player1, @player2)
    assert_instance_of Turn, turn
  end

    def test_it_has_type
      turn = Turn.new(@player1, @player2)
      assert_equal :basic, turn.type
    end

    def test_it_can_set_a_type
      turn = Turn.new(@player1, @player2)
      assert_equal :basic, turn.type

      turn.type = :war
      assert_equal :war, turn.type
    end

    def test_spoils_of_war_is_empty_array
      turn = Turn.new(@player1, @player2)
      assert_equal [], turn.spoils_of_war
    end

    def test_there_is_a_winner
      turn = Turn.new(@player1, @player2)
      assert_equal @player1, turn.winner
    end

    def test_pile_of_cards_adds_to_spoils_of_war
      turn = Turn.new(@player1, @player2)
      card1 = @player1.deck.cards[0]
      card2 = @player2.deck.cards[0]
      turn.pile_cards
      assert_equal [card1, card2], turn.spoils_of_war
    end

    def test_spoils_of_war_added_to_winner
      turn = Turn.new(@player1, @player2)
      turn.award_spoils(@player1)
      assert_equal 5, @player1.deck.cards.count
    end

    def test_change_turn_type
      turn = Turn.new(@player1, @player2)
      assert_equal :basic, turn.type
      turn.type = :war
      assert_equal :war, turn.type
    end

    def test_there_is_a_winner_for_war
      turn = Turn.new(@player1, @player2)
      assert_equal @player1, turn.winner #look here later should be @player2
    end

    def test_change_turn_type_to_mad
      turn = Turn.new(@player1, @player2)
      assert_equal :basic, turn.type
      turn.type = :mad
      assert_equal :mad, turn.type
    end
  end
