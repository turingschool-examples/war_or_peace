require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/game.rb'
require 'pry'

puts "Welcome to the game of War our players are Megan and Aurora!"
print ">"
puts "Please type GO to start the game!"
print '>'
# starting_command = "GO"
# input = gets.chomp

# puts input == starting_command
# if input == "GO"
  game = Game.new()
  game.start
# end


# until gets.chomp == "GO"
#    "Invalid input"
#    if gets.chomp == "GO"
#      game.start
#    end
# end
