require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
#require './lib/game'
require 'pry'

deck = []
suits = [:heart, :diamond, :spade, :club]
ranks = (2..14).to_a

rank_value_pairs = {}
ranks.each do |rank|
  key = rank
  value = rank.to_s
    if value == "11"
      value = "Jack"
    elsif value == "12"
      value = "Queen"
    elsif value == "13"
      value = "King"
    elsif value == "14"
      value = "Ace"
    end
  rank_value_pairs[key] = value
end

suits.each do |suit|
    rank_value_pairs.each do |rank, value|
    deck << Card.new(suit, value, rank)
  end
end

shuffled_cards = deck.shuffle
deck1 = Deck.new(shuffled_cards.slice(0, 26))
deck2 = Deck.new(shuffled_cards.slice(26, 26))

player1 = Player.new("Honey Pie", deck1)
player2 = Player.new("Sgt Pepper", deck2)

def start(player1, player2)
  p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{player1.name} and #{player2.name}." "Type 'GO' to start the game!"
  reply = gets.chomp.upcase
  if reply == "GO"
    take_a_turn(player1, player2)
  end
end

@turn_count = 0

def take_a_turn(player1, player2)
  turn = Turn.new(player1, player2)
  winner = turn.winner
  turn.pile_cards
  turn.award_spoils(winner)
  @turn_count += 1
  p "Turn #{@turn_count}: #{winner.name} won"
end

start(player1, player2)

# if turn_count < 1000000
#   if player1.has_lost? == false && player2.has_lost == false
#
# else
#   puts "---- DRAW ----"




# if input = GO the game starts and then prints to the console different turns until game is completed or no one wins.
