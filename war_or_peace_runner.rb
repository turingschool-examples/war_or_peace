require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'rspec'
require 'pry'

# create cards
# suits = [:heart, :club, :diamond, :spade ]
# rank_vals = {"2" => 2, "3" => 3, "4" => 4, "5" => 5,
#    "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 11,
#    "Queen" => 12, "King" => 13, "Ace" => 14}
#
# cards = []
# suits.each do |suit|
#   rank_vals.each do |rank, value|
#       cards << Card.new(suit, value, rank)
#     end
# end

card_generator = CardGenerator.new('cards.txt')
cards = card_generator.cards

cards.shuffle!
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])

player1 = Player.new("Megan", deck2)
player2 = Player.new("Aurora", deck1)
turn = Turn.new(player1, player2)

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are #{turn.player1.name} and #{turn.player2.name}."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

prompt = gets.chomp

while prompt != "GO"
  puts "Type 'GO' to start the game!"
  puts "------------------------------------------------------------------"
  prompt = gets.chomp
end

game = Game.new(turn)
game.start
