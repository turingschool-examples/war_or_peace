#require 'lib/card'
#require 'lib/deck'
#require 'lib/player'
#require 'lib/turn'
#require 'lib/start'



p "Welcome to War! (or Peace) This game will be played with 52 cards.
  The players today are Megan and Aurora.
  Type 'GO' to start the game!
  ------------------------------------------------------------------"

p "When you're ready type 'GO' to start the game"

user_input = gets.chomp

if user_input == "GO"
  @start.start
else
  p "Sorry you don't want to play, maybe next time!"
end
