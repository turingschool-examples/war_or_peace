require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

deck = []
suits = [:diamond, :heart, :spade, :club]
values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

rank = 1
values.each do |value|
  deck << Card.new(suits[0], value, rank +=1)
end
rank = 1
values.each do |value|
  deck << Card.new(suits[1], value, rank +=1)
end
rank = 1
values.each do |value|
  deck << Card.new(suits[2], value, rank +=1)
end
rank = 1
values.each do |value|
  deck << Card.new(suits[3], value, rank +=1)
end

# binding.pry
# deck << card1 = Card.new(:diamond, '2', 2)
# deck << card2 = Card.new(:diamond, '3', 3)
# deck << card3 = Card.new(:diamond, '4', 4)
# deck << card4 = Card.new(:diamond, '5', 5)
# deck << card5 = Card.new(:diamond, '6', 6)
# deck << card6 = Card.new(:diamond, '7', 7)
# deck << card7 = Card.new(:diamond, '8', 8)
# deck << card8 = Card.new(:diamond, '9', 9)
# deck << card9 = Card.new(:diamond, '10', 10)
# deck << card10 = Card.new(:diamond, 'Jack', 11)
# deck << card11 = Card.new(:diamond, 'Queen', 12)
# deck << card12 = Card.new(:diamond, 'King', 13)
# deck << card13 = Card.new(:diamond, 'Ace', 14)
# deck << card14 = Card.new(:heart, '2', 2)
# deck << card15 = Card.new(:heart, '3', 3)
# deck << card16 = Card.new(:heart, '4', 4)
# deck << card17 = Card.new(:heart, '5', 5)
# deck << card18 = Card.new(:heart, '6', 6)
# deck << card19 = Card.new(:heart, '7', 7)
# deck << card20 = Card.new(:heart, '8', 8)
# deck << card21 = Card.new(:heart, '9', 9)
# deck << card22 = Card.new(:heart, '10', 10)
# deck << card23 = Card.new(:heart, 'Jack', 11)
# deck << card24 = Card.new(:heart, 'Queen', 12)
# deck << card25 = Card.new(:heart, 'King', 13)
# deck << card26 = Card.new(:heart, 'Ace', 14)
# deck << card27 = Card.new(:spade, '2', 2)
# deck << card28 = Card.new(:spade, '3', 3)
# deck << card29 = Card.new(:spade, '4', 4)
# deck << card30 = Card.new(:spade, '5', 5)
# deck << card31 = Card.new(:spade, '6', 6)
# deck << card32 = Card.new(:spade, '7', 7)
# deck << card33 = Card.new(:spade, '8', 8)
# deck << card34 = Card.new(:spade, '9', 9)
# deck << card35 = Card.new(:spade, '10', 10)
# deck << card36 = Card.new(:spade, 'Jack', 11)
# deck << card37 = Card.new(:spade, 'Queen', 12)
# deck << card38 = Card.new(:spade, 'King', 13)
# deck << card39 = Card.new(:spade, 'Ace', 14)
# deck << card40 = Card.new(:club, '2', 2)
# deck << card41 = Card.new(:club, '3', 3)
# deck << card42 = Card.new(:club, '4', 4)
# deck << card43 = Card.new(:club, '5', 5)
# deck << card44 = Card.new(:club, '6', 6)
# deck << card45 = Card.new(:club, '7', 7)
# deck << card46 = Card.new(:club, '8', 8)
# deck << card47 = Card.new(:club, '9', 9)
# deck << card48 = Card.new(:club, '10', 10)
# deck << card49 = Card.new(:club, 'Jack', 11)
# deck << card50 = Card.new(:club, 'Queen', 12)
# deck << card51 = Card.new(:club, 'King', 13)
# deck << card52 = Card.new(:club, 'Ace', 14)

deck.shuffle!
shuffled_deck1 = []
shuffled_deck2 = []
shuffled_deck1 << deck[0..25]
shuffled_deck2 << deck[26..51]
deck1 = Deck.new(shuffled_deck1)
deck2 = Deck.new(shuffled_deck2)
deck1.cards.flatten!
deck2.cards.flatten!
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
game = Game.new(turn)

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are #{player1.name} and #{player2.name}."
p "Type 'GO' to start the game!"
start_command = gets.chomp
if start_command == "GO"
  game.start
elsif start_command != "GO"
  p "You are terrible at following directions, but let's start anyway"
  game.start
end
