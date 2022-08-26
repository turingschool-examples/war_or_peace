require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/player'
require './lib/game'

# Create 52 cards.
# Put this in game class. call game.create_card
card_inputs = []
suits = [:spade, :heart, :diamond, :club]
values_ranks = [['Ace', 14], ['King', 13], ['Queen', 12], ['Jack', 11], 
                ['Ten', 10], ['Nine', 9], ['Eight', 8], ['Seven', 7], ['Six', 6], 
                ['Five', 5], ['Four', 4], ['Three', 3], ['Two', 2]]
values_ranks.each do |card|
  card_inputs << [suits[0], card].flatten
  card_inputs << [suits[1], card].flatten
  card_inputs << [suits[2], card].flatten
  card_inputs << [suits[3], card].flatten
end
card_inputs.shuffle!

cards = card_inputs.map do |input|
  Card.new(input[0], input[1], input[2])
end
# p cards.length

# Get txt file inport from Learn to Program pg 71
# filename = 

test_card_1 = Card.new(:spade)


# Create two decks
deck_1 = Deck.new(cards[0, 26])
deck_2 = Deck.new(cards[26, 26])
# p deck_1.card_list.length
# p deck_1.card_list.length

# Create two players
player_1 = Player.new('Megan', deck_1)
player_2 = Player.new('Aurora', deck_2)
turn = Turn.new(player_1, player_2)
game = Game.new(turn)


# start
puts 'Welcome to War! (or Peace). This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
game.start