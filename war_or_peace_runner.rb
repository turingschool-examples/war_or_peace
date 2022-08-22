require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require './lib/engine'
require 'pry'

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


turn = Turn.new(player1, player2)
case turn.winner
when player1
  if turn.type == :war
    puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
  elsif turn.type == :basic
    puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
  else
    'somethign really wrong'
  end
when player2
  if turn.type == :war
    puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
  elsif turn.type == :basic
    puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
  else
    'somethign really wrong'
  end
when 'No Winner'
  puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
else
  # do this
end

# an until loop is created that will go until the counter reaches 10,000
until counter >= 1_000_000
  # evaluate the turn#winner
  turn.award_spoils(turn.pile_cards)
  
  break if turn.player1.has_lost? || turn.player2.has_lost?
  case turn.winner

  when player1
    if turn.type == :war
      puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
    elsif turn.type == :basic
      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
    else
      'somethign really wrong'
    end

  when player2

    if turn.type == :war
      puts "Turn #{counter}: WAR - #{turn.winner.name} won 6 cards"
    elsif turn.type == :basic
      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
    else
      'somethign really wrong'
    end
  when 'No Winner'

    puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"

  else
    'turn.winner failed'
  end

  

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
