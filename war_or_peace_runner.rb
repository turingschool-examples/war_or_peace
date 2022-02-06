#
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/create_deck'
require './lib/start'

prompt = "> "
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"
print prompt

while user_input = gets.chomp.upcase
  case user_input
  when "GO"
    game= Start.new
    game.start
    break
  else
    p "Please enter GO to begin"
    print prompt
  end
end
