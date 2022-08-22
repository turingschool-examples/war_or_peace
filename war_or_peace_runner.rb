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

turn = Turn.new(player1, player2)

counter = 1

until counter == 1_000_000
  
  break if player1.has_lost? || player2.has_lost?

  winner = turn.winner
  
  case turn.type
  when :basic
    turn.pile_cards
    puts "turn #{counter}: #{winner.name} won #{turn.spoils_of_war.count} cards"
    turn.award_spoils(winner)
  when :war
    turn.pile_cards
    puts "turn #{counter}: WAR - #{winner.name} won #{turn.spoils_of_war.count} cards"
    turn.award_spoils(winner)
  when :mutually_assured_destruction
    turn.pile_cards
    puts '*mutually assured destruction* 6 cards removed from play'
  else
    'big oops'
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
