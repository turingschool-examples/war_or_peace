require './lib/game'


p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

answer = ""
count = 0

until answer == "GO"
  answer = gets.chomp
  count += 1

  if answer == "GO"
    game = Game.new
    game.start
  else
    p "Please type 'GO' to begin the game!"
  end
  if count >= 10
    p "It seems like it's not a good time to play War. Maybe another time!"
    break
  end
end
