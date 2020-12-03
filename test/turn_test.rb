require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/player'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test

  def test_it_exists
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
    assert_instance_of Turn, turn
  end


  def test_type_basic
    #Megan's cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card5 = Card.new(:heart, '8', 8)
    card8 = Card.new(:diamond, '2', 2)
    #Aurora's cards
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    test = turn.type

    assert_equal :basic, test
  end
  def test_type_war
    #Megan's cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card5 = Card.new(:heart, '8', 8)
    card8 = Card.new(:diamond, '2', 2)
    #Aurora's cards
    card3 = Card.new(:spade, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    test = turn.type

    assert_equal :war, test
  end
  def test_type_mutually_assured_destruction
    #Megan's cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card5 = Card.new(:heart, '8', 8)
    card8 = Card.new(:diamond, '2', 2)
    #Aurora's cards
    card3 = Card.new(:spade, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    test = turn.type

    assert_equal :mutually_assured_destruction, test
  end

  def test_winner_basic
    #Megan's cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card5 = Card.new(:heart, '8', 8)
    card8 = Card.new(:diamond, '2', 2)
    #Aurora's cards
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    test = turn.winner
    #return the winner of the turn
    assert_equal player1, test
  end
  def test_winner_war
    #Megan's cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card5 = Card.new(:heart, '8', 8)
    card8 = Card.new(:diamond, '2', 2)
    #Aurora's cards
    card3 = Card.new(:spade, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

  def test_winner_mutually_assured_destruction
    #Megan's cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card5 = Card.new(:heart, '8', 8)
    card8 = Card.new(:diamond, '2', 2)
    #Aurora's cards
    card3 = Card.new(:spade, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    test = turn.winner

    #return the winner of the turn
    assert_equal "No winner", test
  end

  def test_pile_cards
    #cards are sent from player's decks into spoils of war.
  end

  def test_award_spoils
    #add cards in @spoils_of_war to the winner of each turn
  end
end
end 
