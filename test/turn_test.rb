require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

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

  def test_it_has_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    deck3 = Deck.new([card1, card9, card5])
    deck4 = Deck.new([card4, card3, card6])

    deck5 = Deck.new([card9, card2 , card1])
    deck6 = Deck.new([card8, card3, card4])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    player3 = Player.new("Megan", deck3)
    player4 = Player.new("Aurora", deck4)

    player5 = Player.new("Megan", deck5)
    player6 = Player.new("Aurora", deck6)

    turn = Turn.new(player1, player2)
    turn2 = Turn.new(player3, player4)
    turn3 = Turn.new(player5, player6)

    assert_equal :basic, turn.type
    assert_equal :war, turn2.type
    assert_equal :mutually_assured_destruction, turn3.type
  end

  def test_it_has_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    deck3 = Deck.new([card1, card9, card5])
    deck4 = Deck.new([card4, card3, card6])

    deck5 = Deck.new([card9, card2 , card1])
    deck6 = Deck.new([card8, card3, card4])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    player3 = Player.new("Megan", deck3)
    player4 = Player.new("Aurora", deck4)

    player5 = Player.new("Megan", deck5)
    player6 = Player.new("Aurora", deck6)

    turn = Turn.new(player1, player2)
    turn2 = Turn.new(player3, player4)
    turn3 = Turn.new(player5, player6)

    assert_equal player1, turn.winner
    assert_equal player4, turn2.winner
    assert_equal "No winner", turn3.winner
  end

  def test_it_can_pile_cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    deck3 = Deck.new([card1, card9, card5])
    deck4 = Deck.new([card4, card3, card6])

    deck5 = Deck.new([card9, card2 , card1])
    deck6 = Deck.new([card8, card3, card4])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    player3 = Player.new("Megan", deck3)
    player4 = Player.new("Aurora", deck4)

    player5 = Player.new("Megan", deck5)
    player6 = Player.new("Aurora", deck6)

    turn = Turn.new(player1, player2)
    turn2 = Turn.new(player3, player4)
    turn3 = Turn.new(player5, player6)

    assert_equal [card1, card3], turn.pile_cards
    assert_equal [card1, card9, card5, card4, card3, card6], turn2.pile_cards
    assert_equal [], turn3.pile_cards
  end

  def test_it_can_award_spoils
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:heart, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    deck3 = Deck.new([card1, card9, card5])
    deck4 = Deck.new([card4, card3, card6])

    deck5 = Deck.new([card9, card2 , card1])
    deck6 = Deck.new([card8, card3, card4])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    player3 = Player.new("Megan", deck3)
    player4 = Player.new("Aurora", deck4)

    player5 = Player.new("Megan", deck5)
    player6 = Player.new("Aurora", deck6)

    turn = Turn.new(player1, player2)
    turn2 = Turn.new(player3, player4)
    turn3 = Turn.new(player5, player6)

    assert_equal 
  end
end
