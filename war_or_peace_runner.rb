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

turn = Turn.new(player1, player2)
until counter == 1_000_000
  winner_of_hand = turn.winner
  turn.pile_cards

  case turn.type
  when :mutually_assured_destruction
    puts "Turn #{counter}: *mutually assured destruction* 6 cards removed from play"
  when :war
    puts "Turn #{counter}: WAR - #{winner_of_hand.name} won #{turn.spoils_of_war.count} cards"
    turn.award_spoils(winner_of_hand)
  when :basic
    puts "Turn #{counter}: #{winner_of_hand.name} won #{turn.spoils_of_war.count} cards"
    turn.award_spoils(winner_of_hand)
  else
    puts "this type #{turn.type} DID NOT MATCH"
  end

  break if player1.has_lost? || player2.has_lost?

  counter += 1
end

if player1.has_lost?
  puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
elsif player2.has_lost?
  puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
elsif counter == 1_000_000
  puts '---- DRAW ----'
end
