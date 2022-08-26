require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require './lib/game'
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

turn = Turn.new(player1, player2)
game = Game.new(turn)

game.start(player1, player2)

counter = 1
until counter == 10_000

  if game.game_over? # game over
    break
  elsif game.two_card_endgame? # potential endgame
    # handle the situation when turn_type is :war && player with 2 cards loses
    puts 'two_card_endgame'
    break
  elsif game.one_card_endgame? # potential endgame
    game.one_card_endgame
    break
  else
    game.normal_game_play(counter)
  end
  
  
  turn = Turn.new(game.turn.player1, game.turn.player2)
  game = Game.new(turn)

  counter += 1

end

if player1.has_lost?
  puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
elsif player2.has_lost?
  puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
elsif counter >= 10_000
  puts "Turn #{counter}: #{game.hand_winner.name} won 2 cards"
  puts '---- DRAW ----'
end
