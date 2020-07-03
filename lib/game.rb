require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

def welcome
  p "Welcome to War! (or Peace) This game will be played with 52 cards."
  p "the players today are Megan and Aurora."
  p "Type 'GO' to start the game!"
  p ">"
  starter = gets.chomp.upcase
end

def start_game
  if starter =! "GO"
    p "That's not how you spell 'Go'..."
    false
  else true
end
