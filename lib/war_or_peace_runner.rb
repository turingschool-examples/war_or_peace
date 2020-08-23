require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'



p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
p 'The players today are Megan and Aurora.'
p 'Type "GO" to start the game!'
p '------------------------------------------------------------------'

until gets.chomp.upcase == "GO"
  p "Almost! Type 'GO' to start the game!"
  print "> "
end
# How do I get correct input 'GO' to then start the game.start method?
