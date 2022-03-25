require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'
start_word = 'GO'
user_input = ' '

puts "Welcome to War! (or Peace) This game will be played with 52 cards." + "\n"\
"The players today are Megan and Aurora." + "\n"\
"Type '#{start_word}' to start the game!" + "\n"\
"------------------------------------------------------------------" + "\n"

until user_input.upcase == start_word do

  user_input = gets.chomp

  if(user_input.upcase == start_word)
    @turn.start
  elsif(user_input.upcase == "EXIT")
    break
  elsif(user_input.upcase != start_word)
    puts "Invalid input."
  end

end
