require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

cards = CardGenerator.new('cards.txt').cards

shuffled_cards = cards.shuffle

deck1 = Deck.new(shuffled_cards[0..25])
deck2 = Deck.new(shuffled_cards[26..51])

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
puts 'The players today are Megan and Aurora.'
magic_word = 'GO'
user_input = nil

until magic_word == user_input
  puts "Type 'GO' to start the game!"
  print '>'
  user_input = gets.chomp.upcase
end

game = Game.new
game.start(player1, player2)
