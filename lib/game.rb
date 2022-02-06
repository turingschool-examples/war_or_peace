class Game

  def greeting
  line_1 = 'Welcome to War! (or Peace) This game will be played with 52 cards.'
  line_2 = 'The players today are Megan and Aurora.'
  line_3 = "Type 'GO' to start the game!"
  line_4 = '------------------------------------------------------------------'
  "#{line_1}\n#{line_2}\n#{line_3}\n#{line_4}\n"
end

def begin_game(user_input)
  if user_input == 'go' || user_input == 'Go' || user_input == 'GO'
    run
  elsif user_input == 'yoda' || user_input == 'Yoda' || user_input == 'YODA'
    "Wise you are, but enter 'GO' you did not.\nTry again, I request of you."
  elsif user_input == 'q' || user_input == 'quit' || user_input == 'exit' || user_input == 'stop'
    "Thanks for stopping by, please come back and try War (or peace) again!"
  else
    "Invalid response:\nPlease try again and type 'GO'"
  end
end

def run
  card1 = Card.new(:clubs, '2', 2)
  card2 = Card.new(:clubs, '3', 3)
  card3 = Card.new(:clubs, '4', 4)
  card4 = Card.new(:clubs, '5', 5)
  card5 = Card.new(:clubs, '6', 6)
  card6 = Card.new(:clubs, '7', 7)
  card7 = Card.new(:clubs, '8', 8)
  card8 = Card.new(:clubs, '9', 9)
  card9 = Card.new(:clubs, '10', 10)
  card10 = Card.new(:clubs, 'Jack', 11)
  card11 = Card.new(:clubs, 'Queen', 12)
  card12 = Card.new(:clubs, 'King', 13)
  card13 = Card.new(:clubs, 'Ace', 14)
  card14 = Card.new(:diamonds, '2', 2)
  card15 = Card.new(:diamonds, '3', 3)
  card16 = Card.new(:diamonds, '4', 4)
  card17 = Card.new(:diamonds, '5', 5)
  card18 = Card.new(:diamonds, '6', 6)
  card19 = Card.new(:diamonds, '7', 7)
  card20 = Card.new(:diamonds, '8', 8)
  card21 = Card.new(:diamonds, '9', 9)
  card22 = Card.new(:diamonds, '10', 10)
  card23 = Card.new(:diamonds, 'Jack', 11)
  card24 = Card.new(:diamonds, 'Queen', 12)
  card25 = Card.new(:diamonds, 'King', 13)
  card26 = Card.new(:diamonds, 'Ace', 14)
  card27 = Card.new(:hearts, '2', 2)
  card28 = Card.new(:hearts, '3', 3)
  card29 = Card.new(:hearts, '4', 4)
  card30 = Card.new(:hearts, '5', 5)
  card31 = Card.new(:hearts, '6', 6)
  card32 = Card.new(:hearts, '7', 7)
  card33 = Card.new(:hearts, '8', 8)
  card34 = Card.new(:hearts, '9', 9)
  card35 = Card.new(:hearts, '10', 10)
  card36 = Card.new(:hearts, 'Jack', 11)
  card37 = Card.new(:hearts, 'Queen', 12)
  card38 = Card.new(:hearts, 'King', 13)
  card39 = Card.new(:hearts, 'Ace', 14)
  card40 = Card.new(:hearts, '2', 2)
  card41 = Card.new(:hearts, '3', 3)
  card42 = Card.new(:hearts, '4', 4)
  card43 = Card.new(:hearts, '5', 5)
  card44 = Card.new(:hearts, '6', 6)
  card45 = Card.new(:hearts, '7', 7)
  card46 = Card.new(:hearts, '8', 8)
  card47 = Card.new(:hearts, '9', 9)
  card48 = Card.new(:hearts, '10', 10)
  card49 = Card.new(:hearts, 'Jack', 11)
  card50 = Card.new(:hearts, 'Queen', 12)
  card51 = Card.new(:hearts, 'King', 13)
  card52 = Card.new(:hearts, 'Ace', 14)

  deck1 = Deck.new([
  card1,
  card22,
  card37,
  card21,
  card34,
  card23,
  card38,
  card29,
  card4,
  card50,
  card16,
  card30,
  card11,
  card41,
  card25,
  card48,
  card43,
  card18,
  card36,
  card20,
  card10,
  card40,
  card13,
  card2,
  card44,
  card24
  ])

  deck2 = Deck.new([
  card7,
  card9,
  card31,
  card26,
  card3,
  card42,
  card52,
  card32,
  card35,
  card33,
  card28,
  card19,
  card47,
  card12,
  card14,
  card8,
  card17,
  card5,
  card45,
  card46,
  card6,
  card51,
  card15,
  card39,
  card49,
  card27
  ])

  player1 = Player.new('Megan', deck1)
  player2 = Player.new('Aurora', deck2)

  turn = Turn.new(player1, player2)

  # Turn repeater
  1000000.times { |count|
  winner = turn.winner
  puts "Turn #{count + 1}: #{winner.name} won 2 cards" if turn.type == :basic
  puts "Turn #{count + 1}: WAR - #{winner.name} won 6 cards" if turn.type == :war
  puts "Turn #{count +1}: *mutually assured destruction* 6 cards removed from play" if turn.type == :mutually_assured_destruction

  turn.pile_cards
  turn.award_spoils(winner)
  break if player1.has_lost?
  break if player2.has_lost?
  }

  if player1.has_lost?
    puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
  elsif player2.has_lost?
    puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
  else
    puts '---- DRAW ----'
  end
end
end
