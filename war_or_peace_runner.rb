require './lib/game.rb'

card1 = Card.new(:hearts, 'Ace', 14)
card2 = Card.new(:hearts, '2', 2)
card3 = Card.new(:hearts, '3', 3)
card4 = Card.new(:hearts, '4', 4)
card5 = Card.new(:hearts, '5', 5)
card6 = Card.new(:hearts, '6', 6)
card7 = Card.new(:hearts, '7', 7)
card8 = Card.new(:hearts, '8', 8)
card9 = Card.new(:hearts, '9', 9)
card10 = Card.new(:hearts, '10', 10)
card11 = Card.new(:hearts, 'Jack', 11)
card12 = Card.new(:hearts, 'Queen', 12)
card13 = Card.new(:hearts, 'King', 13)
card14 = Card.new(:spades, 'Ace', 14)
card15 = Card.new(:spades, '2', 2)
card16 = Card.new(:spades, '3', 3)
card17 = Card.new(:spades, '4', 4)
card18 = Card.new(:spades, '5', 5)
card19 = Card.new(:spades, '6', 6)
card20 = Card.new(:spades, '7', 7)
card21 = Card.new(:spades, '8', 8)
card22 = Card.new(:spades, '9', 9)
card23 = Card.new(:spades, '10', 10)
card24 = Card.new(:spades, 'Jack', 11)
card25 = Card.new(:spades, 'Queen', 12)
card26 = Card.new(:spades, 'King', 13)
card27 = Card.new(:clubs, 'Ace', 14)
card28 = Card.new(:clubs, '2', 2)
card29 = Card.new(:clubs, '3', 3)
card30 = Card.new(:clubs, '4', 4)
card31 = Card.new(:clubs, '5', 5)
card32 = Card.new(:clubs, '6', 6)
card33 = Card.new(:clubs, '7', 7)
card34 = Card.new(:clubs, '8', 8)
card35 = Card.new(:clubs, '9', 9)
card36 = Card.new(:clubs, '10', 10)
card37 = Card.new(:clubs, 'Jack', 11)
card38 = Card.new(:clubs, 'Queen', 12)
card39 = Card.new(:clubs, 'King', 13)
card40 = Card.new(:diamonds, 'Ace', 14)
card41 = Card.new(:diamonds, '2', 2)
card42 = Card.new(:diamonds, '3', 3)
card43 = Card.new(:diamonds, '4', 4)
card44 = Card.new(:diamonds, '5', 5)
card45 = Card.new(:diamonds, '6', 6)
card46 = Card.new(:diamonds, '7', 7)
card47 = Card.new(:diamonds, '8', 8)
card48 = Card.new(:diamonds, '9', 9)
card49 = Card.new(:diamonds, '10', 10)
card50 = Card.new(:diamonds, 'Jack', 11)
card51 = Card.new(:diamonds, 'Queen', 12)
card52 = Card.new(:diamonds, 'King', 13)

cards1 = [card1, card3, card5, card7, card9,
         card11, card13, card15, card17,
         card19, card21, card23, card25,
         card27, card29, card31, card33,
         card35, card37, card39, card41,
         card43, card45, card47, card49,
         card51]

cards2 = [card2, card4, card6, card8, card10,
         card12, card14, card16, card18,
         card20, card22, card24, card26,
         card28, card30, card32, card34,
         card36, card38, card40, card42,
         card44, card46, card48, card50,
         card52]

cards1.shuffle!
cards2.shuffle!

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

game = Game.new(player1, player2)

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"

input = gets.chomp.upcase
  if input != "GO"
    p "try again please!"
  elsif input == "GO"
    game.start
  end
