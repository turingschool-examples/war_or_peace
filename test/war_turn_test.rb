require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class DeckTest < Minitest::Test

def test_war_type
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
  assert_equal player2, winner
  turn.pile_cards
  compiled_winner = [card1, card2, card5, card4, card3, card6]
  assert_equal compiled_winner, turn.spoils_of_war
  turn.award_spoils(winner)
  assert_equal deck1, player1.deck
  assert_equal deck2, player2.deck
end

def test_end_of_game_scenario
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart, '9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, 'Queen', 12)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)
  deck1 = Deck.new([card1, card2])
  deck2 = Deck.new([card4, card3, card6])
  player1 = Player.new("Megan", deck1)
  player2 = Player.new("Aurora", deck2)
  turn = Turn.new(player1, player2)
  assert_equal :end_of_game_scenario, turn.type
  winner = turn.winner
  assert_equal player2, winner
  turn.pile_cards
  compiled_winner = [card1, card2, card4, card3, card6]
  require "pry"
  binding.pry
  assert_equal compiled_winner, turn.spoils_of_war
  turn.award_spoils(winner)
  assert_equal deck1, player1.deck
  assert_equal deck2, player2.deck
end

end
