require 'pry'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/card.rb'


card1 = Card.new(:heart, 'Ace', 14)
card2 = Card.new(:heart, 'King', 13)
card3 = Card.new(:heart, 'Queen', 12)
card4 = Card.new(:heart, 'Jack', 11)
card5 = Card.new(:heart, '10', 10)
card6 = Card.new(:heart, '9', 9)
card7 = Card.new(:heart, '8', 8)
card8 = Card.new(:heart, '7', 7)
card9 = Card.new(:heart, '6', 6)
card10 = Card.new(:heart, '5', 5)
card11 = Card.new(:heart, '4', 4)
card12 = Card.new(:heart, '3', 3)
card13 = Card.new(:heart, '2', 2)

card14 = Card.new(:spade, 'Ace', 14)
card15 = Card.new(:spade, 'King', 13)
card16 = Card.new(:spade, 'Queen', 12)
card17 = Card.new(:spade, 'Jack', 11)
card18 = Card.new(:spade, '10', 10)
card19 = Card.new(:spade, '9', 9)
card20 = Card.new(:spade, '8', 8)
card21 = Card.new(:spade, '7', 7)
card22 = Card.new(:spade, '6', 6)
card23 = Card.new(:spade, '5', 5)
card24 = Card.new(:spade, '4', 4)
card25 = Card.new(:spade, '3', 3)
card26 = Card.new(:spade, '2', 2)

card27 = Card.new(:club, 'Ace', 14)
card28 = Card.new(:club, 'King', 13)
card29 = Card.new(:club, 'Queen', 12)
card30 = Card.new(:club, 'Jack', 11)
card31 = Card.new(:club, '10', 10)
card32 = Card.new(:club, '9', 9)
card33 = Card.new(:club, '8', 8)
card34 = Card.new(:club, '7', 7)
card35 = Card.new(:club, '6', 6)
card36 = Card.new(:club, '5', 5)
card37 = Card.new(:club, '4', 4)
card38 = Card.new(:club, '3', 3)
card39 = Card.new(:club, '2', 2)


card40 = Card.new(:diamond, 'Ace', 14)
card41 = Card.new(:diamond, 'King', 13)
card42 = Card.new(:diamond, 'Queen', 12)
card43 = Card.new(:diamond, 'Jack', 11)
card44 = Card.new(:diamond, '10', 10)
card45 = Card.new(:diamond, '9', 9)
card46 = Card.new(:diamond, '8', 8)
card47 = Card.new(:diamond, '7', 7)
card48 = Card.new(:diamond, '6', 6)
card49 = Card.new(:diamond, '5', 5)
card50 = Card.new(:diamond, '4', 4)
card51 = Card.new(:diamond, '3', 3)
card52 = Card.new(:diamond, '2', 2)

complete_deck = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]
random_deck = complete_deck.shuffle
deck1 = Deck.new(random_deck[0..25])
deck2 = Deck.new(random_deck[26..51])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p 'The players today are Megan and Aurora.'
p "Type 'GO' to start the game!"
p '------------------------------------------------------------------'

p ""
p ""
p ""
turn = Turn.new(player1, player2)
@turn_counter = 0
while turn.player1.has_lost? == false && turn.player2.has_lost? == false && @turn_counter < 1000001
  turn = Turn.new(player1, player2)
  winner = turn.winner
  if turn.type == 'basic'
    p  "#{turn.winner.name} won 2 cards"
  elsif turn.type == 'war'
    p "WAR - #{turn.winner.name} won 6 cards"
  else
    p "*mutually assured destruction* 6 cards removed from play"
  end
  turn.pile_cards
  if winner == player1 || winner == player2
    turn.award_spoils(winner)
  end
  @turn_counter += 1
end
p "game done"
