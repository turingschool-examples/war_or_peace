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

turn1 = Turn.new(player1, player2)
puts "type is #{turn1.type}"
puts "player1 first card rank is #{player1.deck.cards[0].rank}"
puts "player2 first card rank is #{player2.deck.cards[0].rank}"
#puts "player1 "
turn1.winner
#pry.binding

#
# #high_cards = deck.high_ranking_cards
# #index = deck.rank_of_card_at(0)
#
#
# turn1 = Turn.new(player1, player2)
# #puts index
# #deck.percent_high_ranking
# #deck.add_card(card4)
