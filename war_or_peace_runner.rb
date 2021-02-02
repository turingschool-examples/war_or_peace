require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

standard_deck = []
suits = [:spades, :hearts, :diamonds, :clubs]
ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}
suits.each do |suit|
  ranks.size.times do |i|
    standard_deck << Card.new(suit, ranks[i], i+1)
  end
end

shuffled_deck = standard_deck.shuffle
cards1 = shuffled_deck[0..25]
cards2 = shuffled_deck[26..52]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

turn = Turn.new(player1, player2)

game = Game.new(turn)

puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
puts "Type 'GO' to start the game!"
puts '------------------------------------------------------------------'
input = gets.chomp.downcase

if input == 'go'
  game.start
else
  puts 'sadge'
end
