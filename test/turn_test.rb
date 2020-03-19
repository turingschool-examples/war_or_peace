require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < MiniTest::Test

  def setup
    @card1 = Card.new(:heart, "Jack", 11)
    @card2 = Card.new(:heart, "10", 10)
    @card3 = Card.new(:heart, "9", 9)
    @card4 = Card.new(:diamond, "Jack", 11)
    @card5 = Card.new(:heart, "8", 8)
    @card6 = Card.new(:diamond, "Queen", 12)
    @card7 = Card.new(:heart, "3", 3)
    @card8 = Card.new(:diamond, "2", 2)
  end

  def test_existence
    deck1 = Deck.new([@card1, @card2, @card3, @card4])
    deck2 = Deck.new([@card5, @card6, @card7, @card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_instance_of Turn, turn
  end

  def test_player_access
    deck1 = Deck.new([@card1, @card2, @card3, @card4])
    deck2 = Deck.new([@card5, @card6, @card7, @card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_spoils_access
    deck1 = Deck.new([@card1, @card2, @card3, @card4])
    deck2 = Deck.new([@card5, @card6, @card7, @card8])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal [], turn.spoils_of_war
  end

  def test_basic_turn
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal :basic, turn.type
    winner = turn.winner
    assert_equal player1, winner
    turn.pile_cards
    assert_equal [@card1, @card3], turn.spoils_of_war
    turn.award_spoils(winner)
    new_deck1 = [@card2, @card5, @card8, @card1, @card3]
    new_deck2 = [@card4, @card6, @card7]
    assert_equal new_deck1, turn.player1.deck.cards
    assert_equal new_deck2, turn.player2.deck.cards
  end

  def test_war_turn
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal :war, turn.type
    winner = turn.winner
    assert_equal player2, winner
    turn.pile_cards
    card_pile = [@card1, @card4, @card2, @card3, @card5, @card6]
    assert_equal card_pile, turn.spoils_of_war
    winner_deck = [@card7] + card_pile
    turn.award_spoils(winner)
    assert_equal [@card8], turn.player1.deck.cards
    assert_equal winner_deck, turn.player2.deck.cards
  end

  def test_MAD_turn
    @card6 = Card.new(:diamond, "8", 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal :mutually_assured_destruction, turn.type
    winner = turn.winner
    assert_equal "No Winner", winner
    turn.pile_cards
    assert_equal [], turn.spoils_of_war
    assert_equal [@card8], turn.player1.deck.cards
    assert_equal [@card7], turn.player2.deck.cards
  end

  def test_start_game
    deck1 = Deck.new([@card1])
    deck2 = Deck.new([@card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal "Megan", turn.start
  end

  def test_war_out_of_cards
    deck1 = Deck.new([@card1, @card2, @card3, @card5])
    deck2 = Deck.new([@card4, @card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal "Megan", turn.start
  end

end
