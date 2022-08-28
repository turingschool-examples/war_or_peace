require './lib/game'

# filename = "cards.txt"
# cards = CardGenerator.new(filename).cards
#
# name1 = "Will"
# name2 = "Godzilla"
# player1 = Player.new(name1, cards.shuffle.slice(0,26))
# player2 = Player.new(name2, cards.shuffle.slice(0,26))
#
# start_game = Game.new(player1, player2).start

start_game = Game.new.start
# start_game.start
