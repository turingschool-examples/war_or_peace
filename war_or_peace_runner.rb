require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

filename = "cards.txt"

cards = CardGenerator.new(filename).cards

deck1 = Deck.new(cards.shuffle![0..25])
deck2 = Deck.new(cards.shuffle![26..51])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)

lets_go = 'no'

while lets_go != 'GO'
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

lets_go = gets.chomp.to_s
  if lets_go == 'GO'
  else
    puts "Invalid input."
  end
end

turn.start
