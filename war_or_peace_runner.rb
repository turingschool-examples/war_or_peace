require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/turn'
require_relative 'lib/game'


game = Game.new

## note, card generator is already built in to Game class
# separate .txt file not required, a shuffled deck of cards is auto-created via Game.new
shuffled_cards = game.cards
split_deck = [
  Deck.new(shuffled_cards[0..25]),
  Deck.new(shuffled_cards[26..52])
]

player1_name = 'Megan'
player2_name = 'Aurora'

player1 = Player.new(player1_name, split_deck[0])
player2 = Player.new(player2_name, split_deck[1])


goodbye = "Game exiting... \n Goodbye!"
if game.greet(player1, player2).to_s.include?('Error')
  puts goodbye
else
  puts " >"
  prompt = $stdin.gets.chomp

  if prompt != 'GO'
    puts goodbye
  elsif prompt == 'GO'
    game.start(player1, player2)
    puts goodbye
  end

end
