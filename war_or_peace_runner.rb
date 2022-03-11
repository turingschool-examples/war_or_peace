require './lib/card'
require './lib/player'
require './lib/start'
require './lib/deck'
require 'pry'

values = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Qeen', 'King']
suits = [:spade, :club, :heart, :diamond]
rank = [1,2,3,4,5,6,7,8,9,10,11,12,13]

cards = []


52.times do |i| 
    cards << Card.new(suits.sample, values.sample, rank.sample) 
end 

deck1 = []
deck2 = []

26.times do  |i|
    deck1 << cards.sample
end 

deck2.concat(cards - deck1)

player1_deck = Deck.new(deck1)
player2_deck = Deck.new(deck2)

puts 'Please input name for player 1'
player1 = Player.new(gets.chomp, player1_deck)
puts 'Please input name for player 2'
player2 = Player.new(gets.chomp, player2_deck)
game = Start.new(player1,player2)

game.start_game

# checking if there are dups
# array_uniq = cards.uniq => true
# puts array_uniq == cards => false
# puts player1_deck.any?{|x| player2_deck.include?(x)}