# not required
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require 'pry'
# required
require './lib/game'

# all_cards = game.create_full_deck
# all_cards.shuffle!

# player1 = Player.new('Megan', deck1)
# player2 = Player.new('Aurora', deck2)

turn = Turn.new(player1, player2)
game = Game.new(turn)

game.start(player1, player2)

counter = 1

until counter == 1_000

  if game.game_over? # game over
    break
  elsif game.two_card_endgame?
    game.two_card_endgame(counter)
  elsif game.one_card_endgame?
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
