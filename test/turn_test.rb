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
    @card8 = Card.new(:diamond, '8', 8)
  end

  def test_it_exists
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_player_1_can_be_read
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
  end

  def test_player_2_can_be_read
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.player2
  end

  def test_spoils_of_war_can_be_read
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    spoils_of_war = []

    assert_equal spoils_of_war, turn.spoils_of_war
  end

  def test_can_determine_type
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    deck4 = Deck.new([@card4, @card3, @card8, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    player3 = Player.new("Roy", deck3)
    player4 = Player.new("Decker", deck4)
    turn1 = Turn.new(player1, player2)
    turn2 = Turn.new(player1, player3)
    turn3 = Turn.new(player1, player4)

    assert_equal :basic, turn1.type
    assert_equal :war, turn2.type
    assert_equal :mutually_assured_destruction, turn3.type
  end

  def test_can_determine_winner
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    deck4 = Deck.new([@card4, @card3, @card8, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    player3 = Player.new("Roy", deck3)
    player4 = Player.new("Decker", deck4)
    turn1 = Turn.new(player1, player2)
    turn2 = Turn.new(player1, player3)
    turn3 = Turn.new(player1, player4)

    assert_equal player1, turn1.winner
    assert_equal player3, turn2.winner
    assert_equal "No Winner", turn3.winner
  end

  def test_it_can_pile_cards_for_basic
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    deck4 = Deck.new([@card4, @card3, @card8, @card7])
    p1 = Player.new("Megan", deck1)
    p2 = Player.new("Aurora", deck2)
    p3 = Player.new("Roy", deck3)
    p4 = Player.new("Decker", deck4)
    turn1 = Turn.new(p1, p2)
    turn2 = Turn.new(p1, p3)
    turn3 = Turn.new(p1, p4)
    turn1.pile_cards

    assert_equal [@card1, @card3], turn1.spoils_of_war
  end

  def test_it_can_pile_cards_for_war
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    deck4 = Deck.new([@card4, @card3, @card8, @card7])
    p1 = Player.new("Megan", deck1)
    p2 = Player.new("Aurora", deck2)
    p3 = Player.new("Roy", deck3)
    p4 = Player.new("Decker", deck4)
    turn1 = Turn.new(p1, p2)
    turn2 = Turn.new(p1, p3)
    turn3 = Turn.new(p1, p4)
    turn2.pile_cards

    assert_equal [@card1, @card2, @card5, @card4, @card3, @card6], turn2.spoils_of_war
  end

  def test_it_can_pile_cards_for_mad
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    deck4 = Deck.new([@card4, @card3, @card8, @card7])
    p1 = Player.new("Megan", deck1)
    p2 = Player.new("Aurora", deck2)
    p3 = Player.new("Roy", deck3)
    p4 = Player.new("Decker", deck4)
    turn1 = Turn.new(p1, p2)
    turn2 = Turn.new(p1, p3)
    turn3 = Turn.new(p1, p4)
    turn3.pile_cards

    assert_equal [], turn3.spoils_of_war
  end

  def test_it_can_award_spoils
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    deck3 = Deck.new([@card4, @card3, @card6, @card7])
    deck4 = Deck.new([@card4, @card3, @card8, @card7])
    p1 = Player.new("Megan", deck1)
    p2 = Player.new("Aurora", deck2)
    p3 = Player.new("Roy", deck3)
    p4 = Player.new("Decker", deck4)
    turn1 = Turn.new(p1, p2)
    turn2 = Turn.new(p1, p3)
    turn3 = Turn.new(p1, p4)
    turn2.pile_cards
    turn2.award_spoils

    assert_equal [@card8, @card1, @card2, @card5, @card4, @card3, @card6], p1.deck.cards
  end

end
