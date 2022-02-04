#!/Users/johnhennerich/.rbenv/shims/ruby
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

# array of possible suits
suits = [:heart, :spade, :diamond, :club]
#array to hold cards of each suit
cards = []
#create cards for the deck
suits.each do |suit|
    cards << Card.new(suit, '2',2)
    cards << Card.new(suit, '3',3)
    cards << Card.new(suit, '4',4)
    cards << Card.new(suit, '5',5)
    cards << Card.new(suit, '6',6)
    cards << Card.new(suit, '7',7)
    cards << Card.new(suit, '8',8)
    cards << Card.new(suit, '9',9)
    cards << Card.new(suit, '10',10)
    cards << Card.new(suit, 'Jack',11)
    cards << Card.new(suit, 'Queen',12)
    cards << Card.new(suit, 'King',13)
    cards << Card.new(suit, 'Ace',14)
end

#Shuffle the cards and split into to decks
a = cards.shuffle
deck1,deck2 = a.each_slice( (a.size/2).round ).to_a

#create 2 decks to pass to players
player1_deck = Deck.new(deck1)
player2_deck = Deck.new(deck2)

#create 2 players
player1 = Player.new('Megan', player1_deck)
player2 = Player.new('Aurora', player2_deck)

# Take a turn
turn_count = 0 
turn = Turn.new(player1, player2)
while ((player1.deck.cards).length >= 2) && ((player2.deck.cards).length >= 2)
  turn_count += 1
#  binding.pry
  round_type = turn.type
  round_winner = turn.winner
  turn.pile_cards

  if round_winner != "No Winner"
    turn.award_spoils(round_winner)
  else
    puts "No winner this turn"
  end

  if round_type == :basic
    puts "Turn #{turn_count}: #{round_winner.name} won 2 cards #{round_type}"
  elsif round_type == :war
    puts "Turn #{turn_count}: WAR - #{round_winner.name} won 6 cards #{round_type}"
  elsif round_type == :mutually_assured_destruction
    puts "Turn #{turn_count}: *mutually_assured_destruction* 6 cards removed from play"
  end
end
