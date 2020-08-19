require 'minitest/autorun'
require 'minitest/pride'
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
    @card9 = Card.new(:diamond, '8', 8)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @war_deck = Deck.new([@card4, @card3, @card6, @card7])
    @m_a_d_deck = Deck.new([@card4, @card3, @card9, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  #Turn type basic:
  def test_basic_turn_type
    assert_equal :basic, @turn.type
  end

  def test_basic_winner

    assert_equal @player1, @turn.winner
  end

  def test_spoils_of_war_basic
    @turn.pile_cards

    assert_equal [@card1, @card3], @turn.spoils_of_war
  end

  def test_it_can_award_spoils_basic
    # skip
    #Iteration pattern asks for player.deck instead of player.deck.cards ---> ask why it won't work
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)

    expected1 = [@card2, @card5, @card8, @card1, @card3]
    expected2 = [@card4, @card6, @card7]

    assert_equal expected1, @player1.deck.cards
    assert_equal expected2, @player2.deck.cards
  end

  #Turn type war:
  def test_war_turn_type
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal :war, @turn.type
  end

  def test_war_winner
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player2, @turn.winner
  end

  def test_war_type_spoils_of_war
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    expected = [@card1, @card2, @card5, @card4, @card3, @card6]

    assert_equal expected, @turn.spoils_of_war
  end

  def test_it_can_award_spoils_war
    @player2 = Player.new("Aurora", @war_deck)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)

    expected1 = [@card8]
    expected2 = [@card7, @card1, @card2, @card5, @card4, @card3, @card6]

    assert_equal expected1, @player1.deck.cards
    assert_equal expected2, @player2.deck.cards
  end

  #Turn type mutually_assured_destruction:

  def test_m_a_d_turn_type
    @player2 = Player.new("Aurora", @m_a_d_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal :mutually_assured_destruction, @turn.type
  end

  def test_m_a_d_winner
    @player2 = Player.new("Aurora", @m_a_d_deck)
    @turn = Turn.new(@player1, @player2)

    assert_equal "No Winner", @turn.winner
  end

  def test_m_a_d_spoils_of_war
    @player2 = Player.new("Aurora", @m_a_d_deck)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    assert_equal [], @turn.spoils_of_war
  end

  def test_cards_are_not_awarded
    @player2 = Player.new("Aurora", @m_a_d_deck)
    @turn = Turn.new(@player1, @player2)
    @turn.pile_cards

    assert_equal [@card8], @player1.deck.cards
    assert_equal [@card7], @player2.deck.cards 
  end

end
