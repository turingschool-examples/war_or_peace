require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

filename = "cards.txt"

cards = CardGenerator.new(filename).cards # generates a deck from cards.txt
shuffled_cards = cards.shuffle!

deck1 = Deck.new(shuffled_cards[0..25]) # setup of players, decks, and turn 1
deck2 = Deck.new(shuffled_cards[26..51])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)

lets_go = 'no' # setup for user input to begin the game

while lets_go != 'GO' # can accept any input; only progresses once it has recieved 'GO' as input
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

lets_go = gets.chomp.to_s # converts odd inputs to strings; also a failsafe for certain inputs
  if lets_go == 'GO'
  else
    puts "Invalid input."
  end
end

turn.start # starts the game with the start method defined in './lib/turn'
