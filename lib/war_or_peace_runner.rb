require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# suits = [:heart, :diamond, :spade, :club]
# values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
# ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
#
# deck = []
#
# ranks.each do |rank|
#   suits.each do |suit|
#     values.each do |value|
#       card = Card.new(suit, value, rank)
#       deck << card
#       rank += 1
#       break if rank > 13
#     end
#   end
# end

cards = []

card1 = Card.new(:heart, "2", 2)
cards << card1
card2 = Card.new(:heart, "3", 3)
cards << card2
card3 = Card.new(:heart, "4", 4)
cards << card3
card4 = Card.new(:heart, "5", 5)
cards << card4
card5 = Card.new(:heart, "6", 6)
cards << card5
card6 = Card.new(:heart, "7", 7)
cards << card6
card7 = Card.new(:heart, "8", 8)
cards << card7
card8 = Card.new(:heart, "9", 9)
cards << card8
card9 = Card.new(:heart, "10", 10)
cards << card9
card10 = Card.new(:heart, "Jack", 11)
cards << card10
card11 = Card.new(:heart, "Queen", 12)
cards << card11
card12 = Card.new(:heart, "King", 13)
cards << card12
card13 = Card.new(:heart, "Ace", 14)
cards << card13
card14 = Card.new(:diamond, "2", 2)
cards << card14
card15 = Card.new(:diamond, "3", 3)
cards << card15
card16 = Card.new(:diamond, "4", 4)
cards << card16
card17 = Card.new(:diamond, "5", 5)
cards << card17
card18 = Card.new(:diamond, "6", 6)
cards << card18
card19 = Card.new(:diamond, "7", 7)
cards << card19
card20 = Card.new(:diamond, "8", 8)
cards << card20
card21 = Card.new(:diamond, "9", 9)
cards << card21
card22 = Card.new(:diamond, "10", 10)
cards << card22
card23 = Card.new(:diamond, "Jack", 11)
cards << card23
card24 = Card.new(:diamond, "Queen", 12)
cards << card24
card25 = Card.new(:diamond, "King", 13)
cards << card25
card26 = Card.new(:diamond, "Ace", 14)
cards << card26
card27 = Card.new(:spade, "2", 2)
cards << card27
card28 = Card.new(:spade, "3", 3)
cards << card28
card29 = Card.new(:spade, "4", 4)
cards << card29
card30 = Card.new(:spade, "5", 5)
cards << card30
card31 = Card.new(:spade, "6", 6)
cards << card31
card32 = Card.new(:spade, "7", 7)
cards << card32
card33 = Card.new(:spade, "8", 8)
cards << card33
card34 = Card.new(:spade, "9", 9)
cards << card34
card35 = Card.new(:spade, "10", 10)
cards << card35
card36 = Card.new(:spade, "Jack", 11)
cards << card36
card37 = Card.new(:spade, "Queen", 12)
cards << card37
card38 = Card.new(:spade, "King", 13)
cards << card38
card39 = Card.new(:spade, "Ace", 14)
cards << card39
card40 = Card.new(:club, "2", 2)
cards << card40
card41 = Card.new(:club, "3", 3)
cards << card41
card42 = Card.new(:club, "4", 4)
cards << card42
card43 = Card.new(:club, "5", 5)
cards << card43
card44 = Card.new(:club, "6", 6)
cards << card44
card45 = Card.new(:club, "7", 7)
cards << card45
card46 = Card.new(:club, "8", 8)
cards << card46
card47 = Card.new(:club, "9", 9)
cards << card47
card48 = Card.new(:club, "10", 10)
cards << card48
card49 = Card.new(:club, "Jack", 11)
cards << card49
card50 = Card.new(:club, "Queen", 12)
cards << card50
card51 = Card.new(:club, "King", 13)
cards << card51
card52 = Card.new(:club, "Ace", 14)
cards << card52

cards.shuffle!
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

turn = Turn.new(player1, player2)
turn.start

if turn.input == "GO"
  p "that worked!"
else
  loop do
    p "Invalid input - type 'GO' to start the game!"
    input = gets.chomp
    break if input == "GO"
  end
end

turn_count = 0

loop do
  turn_count += 1
  turn.pile_cards

  if player1.has_lost? || player2.has_lost?
    puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
  elsif turn_count == 1000000
    puts "---- DRAW ----"
  end

  break if player1.has_lost? || player2.has_lost?

  if turn.type == :basic
    puts "Turn #{turn_count}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
  elsif turn.type == :war
    puts "Turn #{turn_count}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
  elsif turn.type == :mutually_assured_destruction
    puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
  end

  turn.award_spoils(turn.winner)

  break if turn_count == 1000000
end
