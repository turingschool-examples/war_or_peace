require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# create 52 card (i.e. standard deck)

# split those cards into two deck, randomly

#create two players with the deck created above

#START the game using a new method called START (put it into a class or create a new class)

def commence_game
   p "Welcome to War! (or Peace) This game will be played with 52 cards.
   The players today are #{player1.name} and #{player2.name}.
   Type 'GO' to start the game!
   ____________________________________________________________________"
end

#if input = GO the game starts and then prints to the console different turns until game is completed or no one wins.
