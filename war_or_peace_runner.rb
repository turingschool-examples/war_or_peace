require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

all_cards = []
all_cards << card1 = Card.new(:heart, '2', 1 )
all_cards << card2 = Card.new(:heart, '3', 2 )
all_cards << card3 = Card.new(:heart, '4', 3 )
all_cards << card4 = Card.new(:heart, '5', 4 )
all_cards << card5 = Card.new(:heart, '6', 5 )
all_cards << card6 = Card.new(:heart, '7', 6 )
all_cards << card7 = Card.new(:heart, '8', 7 )
all_cards << card8 = Card.new(:heart, '9', 8 )
all_cards << card9 = Card.new(:heart, '10', 9  )
all_cards << card10 = Card.new(:heart, 'Jack', 10 )
all_cards << card11 = Card.new(:heart, 'Queen', 11 )
all_cards << card12 = Card.new(:heart, 'King', 12 )
all_cards << card13 = Card.new(:heart, 'Ace', 13 )
all_cards << card14 = Card.new(:club, '2', 1 )
all_cards << card15 = Card.new(:club, '3', 2 )
all_cards << card16 = Card.new(:club, '4', 3 )
all_cards << card17 = Card.new(:club, '5', 4 )
all_cards << card18 = Card.new(:club, '6', 5 )
all_cards << card19 = Card.new(:club, '7', 6 )
all_cards << card20 = Card.new(:club, '8', 7 )
all_cards << card21 = Card.new(:club, '9', 8 )
all_cards << card22 = Card.new(:club, '10', 9  )
all_cards << card23 = Card.new(:club, 'Jack', 10 )
all_cards << card24 = Card.new(:club, 'Queen', 11 )
all_cards << card25 = Card.new(:club, 'King', 12 )
all_cards << card26 = Card.new(:club, 'Ace', 13 )
all_cards << card27 = Card.new(:spade, '2', 1 )
all_cards << card28 = Card.new(:spade, '3', 2 )
all_cards << card29 = Card.new(:spade, '4', 3 )
all_cards << card30 = Card.new(:spade, '5', 4 )
all_cards << card31 = Card.new(:spade, '6', 5 )
all_cards << card32 = Card.new(:spade, '7', 6 )
all_cards << card33 = Card.new(:spade, '8', 7 )
all_cards << card34 = Card.new(:spade, '9', 8 )
all_cards << card35 = Card.new(:spade, '10', 9 )
all_cards << card36 = Card.new(:spade, 'Jack', 10 )
all_cards << card37 = Card.new(:spade, 'Queen', 11 )
all_cards << card38 = Card.new(:spade, 'King', 12 )
all_cards << card39 = Card.new(:spade, 'Ace', 13 )
all_cards << card40 = Card.new(:diamond, '2', 1 )
all_cards << card41 = Card.new(:diamond, '3', 2 )
all_cards << card42 = Card.new(:diamond, '4', 3 )
all_cards << card43 = Card.new(:diamond, '5', 4 )
all_cards << card44 = Card.new(:diamond, '6', 5 )
all_cards << card45 = Card.new(:diamond, '7', 6 )
all_cards << card46 = Card.new(:diamond, '8', 7 )
all_cards << card47 = Card.new(:diamond, '9', 8 )
all_cards << card48 = Card.new(:diamond, '10', 9 )
all_cards << card49 = Card.new(:diamond, 'Jack', 10 )
all_cards << card50 = Card.new(:diamond, 'Queen', 11 )
all_cards << card51 = Card.new(:diamond, 'King', 12 )
all_cards << card52 = Card.new(:diamond, 'Ace', 13 )

shuffled_deck = all_cards.shuffle
deck1 = Deck.new(shuffled_deck[0..25])
deck2 = Deck.new(shuffled_deck[26..51])

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
# binding.pry

puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
puts 'Type "GO" to start the game!'
puts '------------------------------------------------------------------'
