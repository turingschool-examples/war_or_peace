require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/player.rb'
require './lib/game.rb'


p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!"
------------------------------------------------------------------

card1 = Card.new(:clubs, 'Ace', 1)
card2 = Card.new(:diamonds, 'Ace', 1)
card3 = Card.new(:hearts, 'Ace', 1)
card4 = Card.new(:spade, 'Ace', 1)
card5 = Card.new(:clubs, '2', 2)
card6 = Card.new(:diamonds, '2', 2)
card7 = Card.new(:hearts, '2', 2)
card8 = Card.new(:spade, '2', 2)
card9 = Card.new(:clubs, '3', 3)
card10 = Card.new(:diamonds, '3', 3)
card11 = Card.new(:hearts, '3', 3)
card12 = Card.new(:spade, '3', 3)
card13 = Card.new(:clubs, '4', 4)
card14 = Card.new(:diamonds, '4', 4)
card15 = Card.new(:hearts, '4', 4)
card16 = Card.new(:spade, '4', 4)
card17 = Card.new(:clubs, '5', 5)
card18 = Card.new(:diamonds, '5', 5)
card19 = Card.new(:hearts, '5', 5)
card20 = Card.new(:spade, '5', 5)
card21 = Card.new(:clubs, '6', 6)
card22 = Card.new(:diamonds, '6', 6)
card23 = Card.new(:hearts, '6', 6)
card24 = Card.new(:spade, '6', 6)
card25 = Card.new(:clubs, '7', 7)
card26 = Card.new(:diamonds, '7', 7)
card27 = Card.new(:hearts, '7', 7)
card28 = Card.new(:spade, '7', 7)
card29 = Card.new(:clubs, '8', 8)
card30 = Card.new(:diamonds, '8', 8)
card31 = Card.new(:hearts, '8', 8)
card32 = Card.new(:spade, '8', 8)
card33 = Card.new(:clubs, '9', 9)
card34 = Card.new(:diamonds, '9', 9)
card35 = Card.new(:hearts, '9', 9)
card36 = Card.new(:spade, '9', 9)
card37 = Card.new(:clubs, '10', 10)
card38 = Card.new(:diamonds, '10', 10)
card39 = Card.new(:hearts, '10', 10)
card40 = Card.new(:spade, '10', 10)
card41 = Card.new(:clubs, '11', 11)
card42 = Card.new(:diamonds, '11', 11)
card43 = Card.new(:hearts, '11', 11)
card44 = Card.new(:spade, '11', 11)
card45 = Card.new(:clubs, '12', 12)
card46 = Card.new(:diamonds, '12', 12)
card47 = Card.new(:hearts, '12', 12)
card48 = Card.new(:spade, '12', 12)
card49 = Card.new(:clubs, '13', 13)
card50 = Card.new(:diamonds, '13', 13)
card51 = Card.new(:hearts, '13', 13)
card52 = Card.new(:spade, '13', 13)

unshuffled_cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]

shuffled_cards = unshuffled_cards.shuffle

deck1 = Deck.new(shuffled_cards[0..25])
deck2 = Deck.new(shuffled_cards[26..51])

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

game = Game.new(player1, player2)
game.start

# found this on stackoverflow as a much simpler version of the below cards but I can't get it to run

# values = %w{A 2 3 4 5 6 7 8 9 10 J Q K} # %w{...} creates an array of strings
# suits = %w{spades hearts diamonds clubs}
# suits.each do |suit|
#   ranks.size.times do |i|
#     stack_of_cards << Card.new(suit.to_sym, ranks[i], i+1)
#   end
# end
