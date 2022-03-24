require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_play'
require './pry'

suits = [:heart, :diamond, :spade, :club]
cards = []
#create 52 cards of a deck and store in cards array
suits.each do |suit|
  13.times do |i|
    index = i + 2
    if(index == 11)
      cards << Card.new(suit, "Jack", index)
    elsif(index == 12)
      cards << Card.new(suit, "Queen", index)
    elsif(index == 13)
      cards << Card.new(suit, "King", index)
    elsif(index == 14)
      cards << Card.new(suit, "Ace", index)
    else
      cards << Card.new(suit, index.to_s, index)
    end
  end
end


deck1 = Deck.new(cards.shuffle)
deck2 = Deck.new(cards.shuffle)
player1 = Player.new("Nadine", deck1)
player2 = Player.new("Taylor", deck2)

puts("Welcome to War! (or Peace) This game will be played with 52
cards. \t The players today are #{player1.name} and #{player2.name}. \t
Type 'GO' to start the game!")
user_input = gets.chomp
#Check that the user entered a valid statement
while (user_input != "GO") && (user_input != "exit")
  puts "Invalid input. Type 'GO' to start the game or 'exit' to exit."
  user_input = gets.chomp
end
#If the user entered GO start the game, if they type exit don't do anything
if user_input == "GO"
  play_game = GamePlay.new(player1, player2)
  play_game.start
  puts("In if ")
end
