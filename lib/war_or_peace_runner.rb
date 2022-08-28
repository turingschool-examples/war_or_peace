require 'rspec'
require './card'
require './deck'
require './player'
require './turn'
require './game'


card1 = Card.new(:heart, "2", 2)
card2 = Card.new(:heart, "3", 3)
card3 = Card.new(:heart, "4", 4)
card4 = Card.new(:heart, "5", 5)
card5 = Card.new(:heart, "6", 6)
card6 = Card.new(:heart, "7", 7)
card7 = Card.new(:heart, "8", 8)
card8 = Card.new(:heart, "9", 9)
card9 = Card.new(:heart, "10", 10)
card10 = Card.new(:heart, "Jack", 11)
card11 = Card.new(:heart, "Queen", 12)
card12 = Card.new(:heart, "King", 13)
card13 = Card.new(:heart, "Ace", 1)

card14 = Card.new(:diamond, "2", 2)
card15 = Card.new(:diamond, "3", 3)
card16 = Card.new(:diamond, "4", 4)
card17 = Card.new(:diamond, "5", 5)
card18 = Card.new(:diamond, "6", 6)
card19 = Card.new(:diamond, "7", 7)
card20 = Card.new(:diamond, "8", 8)
card21 = Card.new(:diamond, "9", 9)
card22 = Card.new(:diamond, "10", 10)
card23 = Card.new(:diamond, "Jack", 11)
card24 = Card.new(:diamond, "Queen", 12)
card25 = Card.new(:diamond, "King", 13)
card26 = Card.new(:diamond, "Ace", 1)

card27 = Card.new(:spade, "2", 2)
card28 = Card.new(:spade, "3", 3)
card29 = Card.new(:spade, "4", 4)
card30 = Card.new(:spade, "5", 5)
card31 = Card.new(:spade, "6", 6)
card32 = Card.new(:spade, "7", 7)
card33 = Card.new(:spade, "8", 8)
card34 = Card.new(:spade, "9", 9)
card35 = Card.new(:spade, "10", 10)
card36 = Card.new(:spade, "Jack", 11)
card37 = Card.new(:spade, "Queen", 12)
card38 = Card.new(:spade, "King", 13)
card39 = Card.new(:spade, "Ace", 1)

card40 = Card.new(:club, "2", 2)
card41 = Card.new(:club, "3", 3)
card42 = Card.new(:club, "4", 4)
card43 = Card.new(:club, "5", 5)
card44 = Card.new(:club, "6", 6)
card45 = Card.new(:club, "7", 7)
card46 = Card.new(:club, "8", 8)
card47 = Card.new(:club, "9", 9)
card48 = Card.new(:club, "10", 10)
card49 = Card.new(:club, "Jack", 11)
card50 = Card.new(:club, "Queen", 12)
card51 = Card.new(:club, "King", 13)
card52 = Card.new(:club, "Ace", 1)


cards = [
card1, 
card2, 
card3, 
card4, 
card5, 
card6, 
card7, 
card8, 
card9, 
card10,
card11,
card12,
card13,
card14,
card15,
card16,
card17,
card18,
card19,
card20,
card21,
card22,
card23,
card24,
card25,
card26,
card27,
card28,
card29,
card30,
card31,
card32,
card33,
card34,
card35,
card36,
card37,
card38,
card39,
card40,
card41,
card42,
card43,
card44,
card45,
card46,
card47,
card48,
card49,
card50,
card51,
card52]

# suits = [:heart, :diamond, :spade, :club]
# values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
# ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1]
# suits.each do |suit|
#   values.each do |value|
#     # cards << [suits: suit, values: value, ranks: ranks[values.find_index(value)]]
#     card1 = Card.new(suit, value, ranks[values.find_index(value)])
#     cards << card1 
#     #maybe use card instead of card1

#   end

# end



two_decks = []
two_decks = cards.shuffle.each_slice(26).to_a


deck1 = Deck.new(two_decks[0])
deck2 = Deck.new(two_decks[1])
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)


 
turn = Turn.new(player1, player2)  
game1 = Game.new(turn)
game1.start 
 


