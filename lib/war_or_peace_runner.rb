require_relative 'turn'
require_relative 'player'
require_relative 'deck'
require_relative 'card'
require_relative 'card_generator'
require 'pry'


def take_turn
  turn = Turn.new(@Jenny, @Marisa)
  binding.pry
  winner = turn.winner
  #turn.pile_cards
end

card_generator = CardGenerator.new
card_generator.create_cards
card_generator.create_decks
@player1 = Player.new("Jenny", @deck1)
@player2 = Player.new("Marisa", @deck2)
# start_game
# x = 0
#while x <= 1000 do
#  take_turn
#  x += 1
#end

@turn_basic = Turn.new(@player1, @player2)
winner = @turn_basic.winner
