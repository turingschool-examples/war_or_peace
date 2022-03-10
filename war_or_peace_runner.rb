require './lib/card'
require './lib/player'
require './lib/start'
require 'pry'

values = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Qeen', 'King']
suits = [:spade, :club, :heart, :diamond]
rank = [1,2,3,4,5,6,7,8,9,10,11,12,13]

cards = []


52.times do |i| 
    cards << Card.new(suits.sample, values.sample, rank.sample) 
end 

player1_deck = []
player2_deck = []

26.times do  |i|
    player1_deck << cards.sample
end 

player2_deck << cards - player1_deck

# player1 = Player.new(gets.chomp, player1_deck)
# player2 = Player.new(gets.chomp, player2_deck)


# @player1 = Player.new(player1, player2_deck)
# @player2 = Player.new(player2, player1_deck)


# checking if there are dups
# array_uniq = cards.uniq => true
# puts array_uniq == cards => false
# puts player1_deck.any?{|x| player2_deck.include?(x)}