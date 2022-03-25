require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require 'pry'
start_word = 'GO'
user_input = ' '
file_name = './lib/cards.txt'

generator = Card_Generator.new(file_name)
generator.cards.shuffle
deck1 = new Deck.new(generator.cards[0..25])
deck2 = new Deck.new(generator.cards[26..52])


puts "Welcome to War! (or Peace) This game will be played with 52 cards." + "\n"\
"The players today are Megan and Aurora." + "\n"\
"Type '#{start_word}' to start the game!" + "\n"\
"------------------------------------------------------------------"

until user_input.upcase == start_word do

  user_input = gets.chomp

  if(user_input.upcase == start_word)
    @game.start
  elsif(user_input.upcase == "EXIT")
    break
  elsif(user_input.upcase != start_word)
    puts "Invalid input."
  end

end
