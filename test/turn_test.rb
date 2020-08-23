require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require  './lib/turn'

class TurnTest < MiniTest::Test
  def test_it_exists_and_has_attributes
    card1 = Card.new(:heart, "10", 10)
    card2 = Card.new(:spade, "Queen", 12)
    card3 = Card.new(:diamond, "5", 5)
    card4 = Card.new(:club, "10", 10)
    card5 = Card.new(:heart, "9", 9)
    card6 = Card.new(:spade, "3", 2)


    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])

    player1 = Player.new("Edward", deck1)
    player2 = Player.new("Lucy", deck2)


    turn = Turn.new(player1, player2)
    winner = turn.winner

    assert_instance_of Turn, turn
    assert_equal "Edward", turn.player1.name
    assert_equal "Lucy", turn.player2.name
  end

def test_it_has_methods
  card1 = Card.new(:heart, "10", 10)
  card2 = Card.new(:spade, "Queen", 12)
  card3 = Card.new(:diamond, "5", 5)
  card4 = Card.new(:club, "10", 10)
  card5 = Card.new(:heart, "9", 9)
  card6 = Card.new(:spade, "3", 2)


  deck1 = Deck.new([card1, card2, card3])
  deck2 = Deck.new([card4, card5, card6])

  player1 = Player.new("Edward", deck1)
  player2 = Player.new("Lucy", deck2)

  turn = Turn.new(player1, player2)

  assert_equal [], turn.spoils_of_war
  assert_equal :war, turn.type
  winner = turn.winner

  turn.pile_cards

  assert_equal 2, turn.spoils_of_war.count

  turn.award_spoils(winner)

  assert_equal [], turn.spoils_of_war
  assert_equal 6, player1.deck.cards.count
  assert_equal [], player2.deck.cards
  end
end
