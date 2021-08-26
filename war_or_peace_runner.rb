require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

card1 = Card.new(:hearts, "2", 2)
card2 = Card.new(:hearts, "3", 3)
card3 = Card.new(:hearts, "4", 4)
card4 = Card.new(:hearts, "5", 5)
card5 = Card.new(:hearts, "6", 6)
card6 = Card.new(:hearts, "7", 7)
card7 = Card.new(:hearts, "8", 8)
card8 = Card.new(:hearts, "9", 9)
card9 = Card.new(:hearts, "10", 10)
card10 = Card.new(:hearts, "Jack", 11)
card11 = Card.new(:hearts, "Queen", 12)
card12 = Card.new(:hearts, "King", 13)
card13 = Card.new(:hearts, "Ace", 14)
card14 = Card.new(:diamonds, "2", 2)
card15 = Card.new(:diamonds, "3", 3)
card16 = Card.new(:diamonds, "4", 4)
card17 = Card.new(:diamonds, "5", 5)
card18 = Card.new(:diamonds, "6", 6)
card19 = Card.new(:diamonds, "7", 7)
card20 = Card.new(:diamonds, "8", 8)
card21 = Card.new(:diamonds, "9", 9)
card22 = Card.new(:diamonds, "10", 10)
card23 = Card.new(:diamonds, "Jack", 11)
card24 = Card.new(:diamonds, "Queen", 12)
card25 = Card.new(:diamonds, "King", 13)
card26 = Card.new(:diamonds, "Ace", 14)
card27 = Card.new(:clubs, "2", 2)
card28 = Card.new(:clubs, "3", 3)
card29 = Card.new(:clubs, "4", 4)
card30 = Card.new(:clubs, "5", 5)
card31 = Card.new(:clubs, "6", 6)
card32 = Card.new(:clubs, "7", 7)
card33 = Card.new(:clubs, "8", 8)
card34 = Card.new(:clubs, "9", 9)
card35 = Card.new(:clubs, "10", 10)
card36 = Card.new(:clubs, "Jack", 11)
card37 = Card.new(:clubs, "Queen", 12)
card38 = Card.new(:clubs, "King", 13)
card39 = Card.new(:clubs, "Ace", 14)
card40 = Card.new(:spades, "2", 2)
card41 = Card.new(:spades, "3", 3)
card42 = Card.new(:spades, "4", 4)
card43 = Card.new(:spades, "5", 5)
card44 = Card.new(:spades, "6", 6)
card45 = Card.new(:spades, "7", 7)
card46 = Card.new(:spades, "8", 8)
card47 = Card.new(:spades, "9", 9)
card48 = Card.new(:spades, "10", 10)
card49 = Card.new(:spades, "Jack", 11)
card50 = Card.new(:spades, "Queen", 12)
card51 = Card.new(:spades, "King", 13)
card52 = Card.new(:spades, "Ace", 14)

card_shuffler = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]

card_shuffler.shuffle => shuffled_cards

deck1 = Deck.new(shuffled_cards[0..25])
deck2 = Deck.new(shuffled_cards[26..51])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)

lets_go = 'no'

while lets_go != 'GO'
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

lets_go = gets.chomp.to_s
  if lets_go == 'GO'
  else
    puts "Invalid input."
  end
end

turn.start
