require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require './lib/engine'

def create_full_deck
  values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
  ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  values_and_ranks = values.zip(ranks)
  full_deck = []
  values_and_ranks.map do |x|
    full_deck << [x, :diamond].flatten
    full_deck << [x, :heart].flatten
    full_deck << [x, :spade].flatten
    full_deck << [x, :club].flatten
  end

  full_deck = full_deck.map do |x|
    Card.new(x[2], x[0], x[1])
  end
end

all_cards = create_full_deck
all_cards.shuffle!

deck1 = Deck.new(all_cards.slice!(0, 26))
deck2 = Deck.new(all_cards)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

game = Engine.new

game.start(player1, player2)

counter = 1

# a new turn is created with player1 and player2
turn = Turn.new(player1, player2)
# an until loop is created that will go until the counter reaches 10,000
until counter >= 1_000_000
  # evaluate the turn#winner
  case turn.winner
    # when turn#winner returns 'No Winner'
  when 'No Winner'
    # put this message
    puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
    # and make a call to turn#pile_cards (which will change the turn#type) and exit this case statement; #pile_cards is supposed to remove 6 cards total and subtract 3 cards from each players deck
    turn.pile_cards
    # when turn#winner == turn.player1
  when turn.player1
    # and turn#type == :war
    if turn.type == :war
      # put this message to the terminal
      puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
      # and pass the return value from turn#pile_cards to turn#award_spoils which is supposed to move cards from turn.spoils_of_war to the winner#deck
      # turn.award_spoils(turn.pile_cards)
      # if turn.player1 == turn.winner && turn.type == :basic
    elsif turn.type == :basic
      # put this message to the terminal
      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
      # and pass the return value from turn#pile_cards(which will fundamentally change the turn#type) to turn#award_spoils
      # if turn.winner == player1 and the type is !:war && !:basic
    else
      'somethign really wrong'
    end
    turn.award_spoils(turn.pile_cards)
    # when turn.winner = turn.player2
  when turn.player2
    # if the turn#type == :war
    if turn.type == :war
      # put this line to the terminal
      puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
      # and pass the return value of turn#pile_cards to the #award_spoils method, and exit the if block
      # turn.award_spoils(turn.pile_cards)
      # if the turn#type == :basic
    elsif turn.type == :basic
      # put this line to the terminal
      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
      # and pass the return value of #pile_cards to #award_spoils
    else
      'somethign really wrong'
    end
    turn.award_spoils(turn.pile_cards)
  else
    'turn.winner failed'
  end

  break if turn.player1.has_lost? || turn.player2.has_lost?
  
  counter += 1
end

if player1.has_lost?
  puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
elsif player2.has_lost?
  puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
elsif counter >= 1_000_000
  puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
  puts '---- DRAW ----'
end
