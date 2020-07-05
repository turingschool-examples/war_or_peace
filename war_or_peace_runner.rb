require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

@card1 = Card.new(:spade, '2', 2)
@card2 = Card.new(:club, '2', 2)
@card3 = Card.new(:heart, '2', 2)
@card4 = Card.new(:diamond, '2', 2)
@card5 = Card.new(:spade, '3', 3)
@card6 = Card.new(:club, '3', 3)
@card7 = Card.new(:heart, '3', 3)
@card8 = Card.new(:diamond, '3', 3)
@card9 = Card.new(:spade, '4', 4)
@card10 = Card.new(:club, '4', 4)
@card11 = Card.new(:heart, '4', 4)
@card12 = Card.new(:diamond, '4', 4)
@card13 = Card.new(:spade, '5', 5)
@card14 = Card.new(:club, '5', 5)
@card15 = Card.new(:heart, '5', 5)
@card16 = Card.new(:diamond, '5', 5)
@card17 = Card.new(:spade, '6', 6)
@card18 = Card.new(:club, '6', 6)
@card19 = Card.new(:heart, '6', 6)
@card20 = Card.new(:diamond, '6', 6)
@card21 = Card.new(:spade, '7', 7)
@card22 = Card.new(:club, '7', 7)
@card23 = Card.new(:heart, '7', 7)
@card24 = Card.new(:diamond, '7', 7)
@card25 = Card.new(:spade, '8', 8)
@card26 = Card.new(:club, '8', 8)
@card27 = Card.new(:heart, '8', 8)
@card28 = Card.new(:diamond, '8', 8)
@card29 = Card.new(:spade, '9', 9)
@card30 = Card.new(:club, '9', 9)
@card31 = Card.new(:heart, '9', 9)
@card32 = Card.new(:diamond, '9', 9)
@card33 = Card.new(:spade, '10', 10)
@card34 = Card.new(:club, '10', 10)
@card35 = Card.new(:heart, '10', 10)
@card36 = Card.new(:diamond, '10', 10)
@card37 = Card.new(:spade, 'Jack', 11)
@card38 = Card.new(:club, 'Jack', 11)
@card39 = Card.new(:heart, 'Jack', 11)
@card40 = Card.new(:diamond, 'Jack', 11)
@card41 = Card.new(:spade, 'Queen', 12)
@card42 = Card.new(:club, 'Queen', 12)
@card43 = Card.new(:heart, 'Queen', 12)
@card44 = Card.new(:diamond, 'Queen', 12)
@card45 = Card.new(:spade, 'King', 13)
@card46 = Card.new(:club, 'King', 13)
@card47 = Card.new(:heart, 'King', 13)
@card48 = Card.new(:diamond, 'King', 13)
@card49 = Card.new(:spade, 'Ace', 14)
@card50 = Card.new(:club, 'Ace', 14)
@card51 = Card.new(:heart, 'Ace', 14)
@card52 = Card.new(:diamond, 'Ace', 14)

deck1 = Deck.new([@card11, @card20, @card5, @card8, @card7, @card1, @card14, @card51,
  @card19, @card2, @card23, @card4, @card41, @card32, @card43, @card36, @card31,
  @card38, @card34, @card39, @card34, @card46, @card47, @card49, @card50, @card15])
deck2 = Deck.new([@card3, @card22, @card9, @card29, @card26, @card52, @card25, @card42,
  @card17, @card43, @card21, @card27, @card24, @card48, @card45, @card28, @card30,
  @card37, @card40, @card35, @card18, @card6, @card16, @card10, @card13, @card12])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)



puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are #{player1.name} and #{player2.name}."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

  counter = 0
  while !player1.has_lost? || !player2.has_lost?

    counter += 1
    if counter >= 100
      puts "---- DRAW ----"
      break
    end
    puts "#{player1.name} has #{deck1.cards.count} cards, and #{player2.name} has #{deck2.cards.count} cards."
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)


    if player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      break
    elsif player2.has_lost?
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      break
    end

    if turn.type == :basic || turn.type == :war
      puts "Turn: #{counter}: #{turn.type.upcase} - #{turn.winner.name} won #{turn.spoils_of_war.count} cards."
     else
      puts "Turn: #{counter}: *#{turn.type.upcase}* - #{turn.spoils_of_war.size} cards removed from play."
    end

  end
