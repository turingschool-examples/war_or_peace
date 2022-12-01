require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'pry'


# #THE DIAMONDS
# card1 = Card.new(:diamond, 'Two', 1)
# card2 = Card.new(:diamond, 'Three', 2)
# card3 = Card.new(:diamond, 'Four', 3)
# card4 = Card.new(:diamond, 'Five', 4)
# card5 = Card.new(:diamond, 'Six', 5)
# card6 = Card.new(:diamond, 'Seven', 6)
# card7 = Card.new(:diamond, 'Eight', 7)
# card8 = Card.new(:diamond, 'Nine', 8)
# card9 = Card.new(:diamond, 'Ten', 9)
# card10 = Card.new(:diamond, 'Jack', 10)
# card11 = Card.new(:diamond, 'Queen', 11)
# card12 = Card.new(:diamond, 'King', 12)
# card13 = Card.new(:diamond, 'Ace', 13)

# #THE SPADES
# card14 = Card.new(:spade, 'Two', 1)
# card15 = Card.new(:spade, 'Three', 2)
# card16 = Card.new(:spade, 'Four', 3)
# card17 = Card.new(:spade, 'Five', 4)
# card18 = Card.new(:spade, 'Six', 5)
# card19 = Card.new(:spade, 'Seven', 6)
# card20 = Card.new(:spade, 'Eight', 7)
# card21 = Card.new(:spade, 'Nine', 8)
# card22 = Card.new(:spade, 'Ten', 9)
# card23 = Card.new(:spade, 'Jack', 10)
# card24 = Card.new(:spade, 'Queen', 11)
# card25 = Card.new(:spade, 'King', 12)
# card26 = Card.new(:spade, 'Ace', 13)

# #THE HEARTS
# card27 = Card.new(:heart, 'Two', 1)
# card28 = Card.new(:heart, 'Three', 2)
# card29 = Card.new(:heart, 'Four', 3)
# card30 = Card.new(:heart, 'Five', 4)
# card31 = Card.new(:heart, 'Six', 5)
# card32 = Card.new(:heart, 'Seven', 6)
# card33 = Card.new(:heart, 'Eight', 7)
# card34 = Card.new(:heart, 'Nine', 8)
# card35 = Card.new(:heart, 'Ten', 9)
# card36 = Card.new(:heart, 'Jack', 10)
# card37 = Card.new(:heart, 'Queen', 11)
# card38 = Card.new(:heart, 'King', 12)
# card39 = Card.new(:heart, 'Ace', 13)

# #THE CLUBS
# card40 = Card.new(:club, 'Two', 1)
# card41 = Card.new(:club, 'Three', 2)
# card42 = Card.new(:club, 'Four', 3)
# card43 = Card.new(:club, 'Five', 4)
# card44 = Card.new(:club, 'Six', 5)
# card45 = Card.new(:club, 'Seven', 6)
# card46 = Card.new(:club, 'Eight', 7)
# card47 = Card.new(:club, 'Nine', 8)
# card48 = Card.new(:club, 'Ten', 9)
# card49 = Card.new(:club, 'Jack', 10)
# card50 = Card.new(:club, 'Queen', 11)
# card51 = Card.new(:club, 'King', 12)
# card52 = Card.new(:club, 'Ace', 13)

# big_deck = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13,
#   card14, card15, card16, card17, card18,  card19, card20, card21, card22, card23, card24, card25, card26, 
#    card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39,
#     card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]

big_deck = CardGenerator.new('cards.txt').cards
shuffled_deck = Deck.new(big_deck.shuffle)

array1 = []
array2 = []
27.times do |i|
array1 << shuffled_deck.cards[i]
array2 << shuffled_deck.cards[i+1]
end

player1_deck = Deck.new(array1)
player2_deck = Deck.new(array2)



puts "Welcome to War! \(or Peace\) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

megan = Player.new("Megan", player1_deck)
aurora = Player.new("Aurora", player2_deck)

turn = Turn.new(megan, aurora)
start = gets

if start == "GO\n"
turn.go
end

