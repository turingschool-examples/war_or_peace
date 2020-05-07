require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

l1 = "Welcome to War! (or Peace) This game will be played with 52 cards."
l2 = "The players today are #{"Megan"} and #{"Aurora"}."
l3 = "Type 'GO' to start the game!"

l1.length.times { print "-" }
puts
puts l1
puts l2
puts l3
l1.length.times { print "-" }
puts

loop do
  start = gets.chomp
  if start == "GO"
    Start.new.start
    break
  else
    p l3
  end
end
