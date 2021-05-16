require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'


card_generator = CardGenerator.new('cards.txt')
deck1 = Deck.new(card_generator.deck_one)
deck2 = Deck.new(card_generator.deck_two)

player1 = Player.new('Billy', deck1)
player2 = Player.new('Lauren', deck2)

turn = Turn.new(player1, player2)
game = Game.new(turn)

p "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are #{turn.player1.name} and #{turn.player2.name}. Type 'GO' to start the game!"

play_game = gets.chomp
if play_game.downcase == 'go'
  game.start
else
  puts 'Some other time maybe'
end
