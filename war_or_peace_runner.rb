require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

##### Iteration 3 card generator method
# def card_generator
#   suits = [:club, :diamond, :spade, :heart]
#   values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
#
#   cards =[]
#   suits.each do |suit|
#     values.each_with_index do |value, index|
#       cards << Card.new(suit, value, index + 2)
#     end
#   end
#   cards
# end
#
# standard_deck = card_generator.shuffle

##### Iteration 4 using card generator class
filename = "cards.txt"
standard_deck = CardGenerator.new(filename).cards.shuffle

deck1 = Deck.new(standard_deck[0..25])
deck2 = Deck.new(standard_deck[26..51])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

intro_message = <<~HEREDOC
    Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{player1.name} and #{player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------
  HEREDOC

puts intro_message
user_input = gets.chomp

if user_input == "GO"
  game = Game.new(player1, player2)
  game.start
else
  puts "Goodbye"
end
