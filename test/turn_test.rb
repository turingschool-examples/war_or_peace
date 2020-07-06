require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'

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
  end

  def test_it_exists
    # skip

    @turn = Turn.new(@player1, @player2)

    assert_instance_of Turn, @turn
  end

  def test_it_has_players
    # skip

    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_it_has_spoils_of_war
    # skip

    @turn = Turn.new(@player1, @player2)

    assert_equal [], @turn.spoils_of_war
  end

  def test_the_turn_type
    # skip

    @turn = Turn.new(@player1, @player2)

    assert_equal :basic, @turn.type
  end

  def test_it_has_a_winner
    # skip

    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.winner
  end

  def test_it_can_pile_cards
    # skip

    @turn = Turn.new(@player1, @player2)

    @turn.type
    @turn.pile_cards

    assert_equal 2, @turn.spoils_of_war.count
  end

  def test_winner_gets_the_spoils
    # skip

    @turn = Turn.new(@player1, @player2)

    the_winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(the_winner)

    assert_equal 5, @player1.deck.cards.length
    assert_equal [@card4, @card6, @card7], @player2.deck.cards
  end

  def test_deck_can_change
    # skip

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    @turn = Turn.new(player1, player2)

    assert_equal [@card4, @card3, @card6, @card7], player2.deck.cards
    end

  def test_the_turn_type_is_war
    # skip

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    @turn = Turn.new(player1, player2)

    assert_equal :war, @turn.type
  end

  def test_the_winner_is_player2
    # skip

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    @turn = Turn.new(player1, player2)

    assert_equal player2, @turn.winner
  end

  def test_it_has_more_spoils_of_war
    # skip

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    @turn = Turn.new(player1, player2)
    @turn.pile_cards

    assert_equal 6, @turn.spoils_of_war.count
  end

  def test_it_can_award_spoils_for_war
    # skip

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    @turn = Turn.new(player1, player2)
    winner = @turn.winner
    @turn.pile_cards

    @turn.award_spoils(winner)

    assert_equal [@card8], player1.deck.cards
    assert_equal 7, player2.deck.cards.size
  end

  def test_mutually_assured_destruction_type
    # skip

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2 )

      assert_equal :mutually_assured_destruction, turn.type
    end

  def test_that_there_is_not_a_winner
    # skip

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_that_spoils_of_war_is_empty
    # skip

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
    assert_equal [], turn.spoils_of_war
  end

  def test_player_decks_have_one_card
    # skip

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal [card8], player1.deck.cards
    assert_equal [card7], player2.deck.cards
  end

end
