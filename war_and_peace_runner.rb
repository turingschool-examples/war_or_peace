require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/player'
require './lib/game'
# require './lib/card_generator'

# Create 52 cards.
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

# Create two decks
deck_1 = Deck.new(cards[0, 26])
deck_2 = Deck.new(cards[26, 26])

# Create two players
player_1 = Player.new('Megan', deck_1)
player_2 = Player.new('Aurora', deck_2)

# Create one turn
turn = Turn.new(player_1, player_2)

# Create one game
game = Game.new(turn)

# start
puts 'Welcome to War! (or Peace). This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
game.start


# # Create 52 cards.
# card_inputs = []
# suits = [:spade, :heart, :diamond, :club]
# values_ranks = [['Ace', 14], ['King', 13], ['Queen', 12], ['Jack', 11], 
#                 ['Ten', 10], ['Nine', 9], ['Eight', 8], ['Seven', 7], ['Six', 6], 
#                 ['Five', 5], ['Four', 4], ['Three', 3], ['Two', 2]]
# values_ranks.each do |card|
#   card_inputs << [suits[0], card].flatten
#   card_inputs << [suits[1], card].flatten
#   card_inputs << [suits[2], card].flatten
#   card_inputs << [suits[3], card].flatten
# end
# card_inputs.shuffle!

# cards = card_inputs.map do |input|
#   Card.new(input[0], input[1], input[2])
# end