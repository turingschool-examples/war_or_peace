require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require './lib/game'
require 'pry'
start_word = 'GO'
user_input = ' '
file_name = './lib/cards.txt'

generator = Card_Generator.new(file_name)
#generator.cards.shuffle
deck1 = Deck.new(generator.cards[0..25].shuffle)
deck2 = Deck.new(generator.cards[26..52].shuffle)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

game = Game.new(player1, player2)


puts "Welcome to War! (or Peace) This game will be played with 52 cards." + "\n"\
"The players today are Megan and Aurora." + "\n"\
"Type '#{start_word}' to start the game!" + "\n"\
"------------------------------------------------------------------"


until user_input == start_word do
  user_input = gets.chomp.upcase

  if(user_input == start_word)
    game.start
  elsif(user_input == "EXIT")
    break
  elsif(user_input != start_word)
    puts "Invalid input."
  end

end
