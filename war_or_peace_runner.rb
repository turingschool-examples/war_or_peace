require './lib/game'

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are: "
print "PLAYER 1: "
name1 = gets.chomp
p "--- AND ---"
print "PLAYER 2: "
name2 = gets.chomp
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"
launch_code = gets.chomp

if launch_code == 'GO'
    game = Game.new(name1, name2)
    game.start
else
    p "You have to use 'GO' to start the game!"
end
