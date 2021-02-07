require_relative 'test_helper'

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

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_attributes
    assert_equal [], @turn.spoils_of_war
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_basic_type
    @turn.player1
    @turn.player2
    assert_equal :basic, @turn.type
  end

  def test_it_has_war_type
    deck1 = Deck.new([@card1, @card5, @card8])
    deck2 = Deck.new([@card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.player1
    turn.player2
    assert_equal :war, turn.type
  end

  def test_it_has_mutually_assured_destruction_type
    # skip
    deck1 = Deck.new([@card1, @card7, @card5])
    deck2 = Deck.new([@card4, @card6, @card9])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.player1
    turn.player2
    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_can_return_winner
    # skip
    @turn.player1
    @turn.player2
    assert_equal @player1, @turn.winner
  end


  def test_it_can_return_pile_cards_basic
    # skip
    @turn.player1
    @turn.player2

    @turn.pile_cards

    assert_equal [@card1, @card3], @turn.spoils_of_war

    assert_equal [@card2, @card5, @card8], @player1.deck.cards
    assert_equal [@card4, @card6, @card7], @player2.deck.cards
  end

  def test_is_can_return_pile_cards_war
    deck1 = Deck.new([@card1, @card5, @card8])
    deck2 = Deck.new([@card4, @card6, @card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.player1
    turn.player2

    turn.pile_cards

    expected = [@card1, @card5, @card8, @card4, @card6, @card7]

    assert_equal expected, turn.spoils_of_war
  end

  def test_is_can_return_pile_cards_war
    deck1 = Deck.new([@card1, @card7, @card5])
    deck2 = Deck.new([@card4, @card6, @card9])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    turn.player1
    turn.player2

    turn.pile_cards

    assert_equal [], turn.spoils_of_war

    assert_equal [], player1.deck.cards
    assert_equal [], player2.deck.cards

  end

  def test_it_can_award_spoils
    @turn.player1
    @turn.player2

    @turn.pile_cards

    @turn.award_spoils(@player1)
    assert_equal [@card2, @card5, @card8, @card1, @card3], @player1.deck.cards
    assert_equal [@card4, @card6, @card7], @player2.deck.cards
    assert_equal [], @turn.spoils_of_war
  end


end
