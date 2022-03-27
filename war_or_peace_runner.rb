require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# require './lib/card_generator'

card1 = Card.new(:heart, '2', 2)
card2 = Card.new(:heart, '3', 3)
card3 = Card.new(:heart, '4', 4)
card4 = Card.new(:heart, '5', 5)
card5 = Card.new(:heart, '6', 6)
card6 = Card.new(:heart, '7', 7)
card7 = Card.new(:heart, '8', 8)
card8 = Card.new(:heart, '9', 9)
card9 = Card.new(:heart, '10', 10)
card10 = Card.new(:heart, 'Jack', 11)
card11 = Card.new(:heart, 'Queen', 12)
card12 = Card.new(:heart, 'King', 13)
card13 = Card.new(:heart, 'Ace', 14)
card14 = Card.new(:diamond, '2', 2)
card15 = Card.new(:diamond, '3', 3)
card16 = Card.new(:diamond, '4', 4)
card17 = Card.new(:diamond, '5', 5)
card18 = Card.new(:diamond, '6', 6)
card19 = Card.new(:diamond, '7', 7)
card20 = Card.new(:diamond, '8', 8)
card21 = Card.new(:diamond, '9', 9)
card22 = Card.new(:diamond, '10', 10)
card23 = Card.new(:diamond, 'Jack', 11)
card24 = Card.new(:diamond, 'Queen', 12)
card25 = Card.new(:diamond, 'King', 13)
card26 = Card.new(:diamond, 'Ace', 14)
card27 = Card.new(:spade, '2', 2)
card28 = Card.new(:spade, '3', 3)
card29 = Card.new(:spade, '4', 4)
card30 = Card.new(:spade, '5', 5)
card31 = Card.new(:spade, '6', 6)
card32 = Card.new(:spade, '7', 7)
card33 = Card.new(:spade, '8', 8)
card34 = Card.new(:spade, '9', 9)
card35 = Card.new(:spade, '10', 10)
card36 = Card.new(:spade, 'Jack', 11)
card37 = Card.new(:spade, 'Queen', 12)
card38 = Card.new(:spade, 'King', 13)
card39 = Card.new(:spade, 'Ace', 14)
card40 = Card.new(:club, '2', 2)
card41 = Card.new(:club, '3', 3)
card42 = Card.new(:club, '4', 4)
card43 = Card.new(:club, '5', 5)
card44 = Card.new(:club, '6', 6)
card45 = Card.new(:club, '7', 7)
card46 = Card.new(:club, '8', 8)
card47 = Card.new(:club, '9', 9)
card48 = Card.new(:club, '10', 10)
card49 = Card.new(:club, 'Jack', 11)
card50 = Card.new(:club, 'Queen', 12)
card51 = Card.new(:club, 'King', 13)
card52 = Card.new(:club, 'Ace', 14)

full_deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51,  card52].shuffle)

# full_deck = Deck.new([card1, card2, card3, card4, card5, card6

# full_deck = Deck.new([])
#
# counter = 0
#
# 52.times do
#   counter += 1
#   full_deck.cards << "card#{counter}"
# end
# full_deck.cards.shuffle

cards1 = []
cards2 = []

 cards1,cards2 = full_deck.cards.each_slice(full_deck.cards.size/2).to_a

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

# puts "Deck 1 contains: #{deck1.cards}."
# puts "Deck 2 contains: #{deck2.cards}."

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

# puts "#{player1}"
# puts "#{player2}"

turn = Turn.new(player1, player2)
turn.start

count = 0
loop do
  count += 1
  if player1.has_lost?
    puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    break
  elsif player2.has_lost?
    puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    break
  elsif player1.has_lost? == false && player2.has_lost? == false
    print "Turn #{count}: "
    if turn.type == :basic
      puts "#{turn.winner.name} won 2 cards"
      turn.pile_cards
      turn.award_spoils(turn.winner)
    elsif turn.type == :war
      puts "WAR - #{turn.winner.name} won 6 cards"
      turn.pile_cards
      turn.award_spoils(turn.winner)
    elsif turn.type == :mutually_assured_destruction
      # binding.pry
      puts "*Mutually Assured Destruction* 6 cards removed from play"
      # binding.pry
      turn.pile_cards
    end
  elsif count == 10000
    # binding.pry
    puts "----DRAW----"
    break
  end
end


# print "Turn #{count}: "
# # turn.type
# if turn.type == :basic
#   puts "#{turn.winner.name} won 2 cards"
#   turn.pile_cards
#   turn.award_spoils(turn.winner)
# elsif turn.type == :war
#   puts "WAR - #{turn.winner.name} won 6 cards"
#   turn.pile_cards
#   turn.award_spoils(turn.winner)
# elsif turn.type == :mutually_assured_destruction
#   # binding.pry
#   puts "*Mutually Assured Destruction* 6 cards removed from play"
#   # binding.pry
#   turn.pile_cards
# end
