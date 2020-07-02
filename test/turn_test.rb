require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"

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

  @turn = Turn.new(@player1, @player2)

  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_attributes
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_has_a_turn_type
    assert_equal :basic, @turn.type

  end

  def test_it_can_name_a_winner
    assert_equal @player1, @turn.winner

  end

  def test_it_can_add_cards_to_spoils_of_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])

    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)




    assert_equal [], turn.spoils_of_war
    assert_equal [card1, card2, card5, card8], player1.deck.cards
    assert_equal [card3, card4, card6, card7], player2.deck.cards
    turn.pile_cards
    assert_equal [card1, card3], turn.spoils_of_war
    assert_equal [card2, card5, card8], player1.deck.cards
    assert_equal [card4, card6, card7], player2.deck.cards
  end

  def test_it_can_award_spoils_to_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])

    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    turn.pile_cards
    winner = turn.winner
    turn.award_spoils(winner)

    assert_equal [card2, card5, card8], player1.deck.cards

    assert_equal [card4, card6, card7, card1, card3], player2.deck.cards

    assert_equal [], turn.spoils_of_war

  end

  def test_it_can_do_war_type_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type

    winner = turn.winner
    assert_equal player2, turn.winner

    turn.pile_cards

    assert_equal 6, turn.spoils_of_war.count

    turn.award_spoils(winner)
    assert_equal 1, player1.deck.cards.count
    assert_equal 7, player2.deck.cards.count

  end

  def test_it_can_do_mad_turn
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

    assert_equal :mutually_assured_destruction, turn.type

    winner = turn.winner
    assert_equal "No Winner", winner

    turn.pile_cards
    assert_equal [], turn.spoils_of_war

    assert_equal 1, player1.deck.cards.count
    assert_equal 1, player2.deck.cards.count



  end


end
