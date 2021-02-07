require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
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

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
  end

  def test_turn_initializes
    skip
    turn1 = Turn.new(@player1, @player2)
    assert_instance_of Turn, turn1
  end

  def test_basic_type
    skip
    turn1 = Turn.new(@player1, @player2)
    assert_equal :basic, turn1.type
  end

  def test_basic_winner_type
    skip
    turn1 = Turn.new(@player1, @player2)
    assert_equal @player1, turn1.winner
  end

  def test_war_type

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    assert_equal :war, turn2.type
  end
  def test_war_winner
    skip
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    #require "pry";binding.pry
    assert_equal player2, turn2.winner

  end

  def test_mutually_assured_destruction
    skip
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    assert_equal :mutually_assured_destruction, turn2.type
  end

  def test_mutually_assured_destruction_winner
    skip
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    assert_equal "No Winner", turn2.winner
  end
  def test_spoils_of_war
    skip
    turn1 = Turn.new(@player1, @player2)

    assert_equal turn1.spoils_of_war, []
  end

  def test_pile_cards_for_basic_turn_type

    turn1 = Turn.new(@player1, @player2)
    turn1.pile_cards
    #require "pry";binding.pry
    assert_equal turn1.spoils_of_war, [@card1, @card3]

  end

  def test_pile_cards_for_war_turn_type
    skip
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)

    assert_equal turn2.pile_cards, turn2.spoils_of_war
  end

  def test_pile_cards_for_MAD_turn_type
    skip
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    turn2.pile_cards
    assert_equal turn2.spoils_of_war, []
  end

  def test_award_spoils_for_basic_turn
    skip
    turn1 = Turn.new(@player1, @player2)
    winner1 = turn1.winner
    turn1.pile_cards
    turn1.award_spoils(winner1)
    #require "pry";binding.pry
    assert_equal 5, winner1.deck.cards.length
  end

  def test_award_spoils_for_war_turn
    skip
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    winner2 = turn2.winner
    turn2.pile_cards
    turn2.award_spoils(winner2)
    #require "pry";binding.pry
    assert_equal 7, winner2.deck.cards.length
  end
  def test_MAD_turn_spoils
    skip
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn2 = Turn.new(player1, player2)
    winner2 = turn2.winner
    turn2.pile_cards
    turn2.award_spoils(winner2)
    assert_equal nil, @spoils_of_war
    assert_equal 1, player1.deck.cards.length
    assert_equal 1, player2.deck.cards.length
  end

end
