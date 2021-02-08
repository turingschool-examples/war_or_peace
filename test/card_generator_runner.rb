require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'


#Game Start Prompt
p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

cue = "> "
start = nil
until (start == 'GO' || start == 'go')
    print cue
    start = gets.chomp
end

#Deck/Cards Setup
full_deck = CardGenerator.new('lib/cards.txt').cards
shuffled_deck = full_deck.shuffle

deck1 = Deck.new([])
deck2 = Deck.new([])

player1 = Player.new('Meagan', deck1)
player2 = Player.new('Aurora', deck2)

26.times do |index|
  player1.deck.cards << shuffled_deck.shift
  player2.deck.cards << shuffled_deck.shift
end

#Game Start
game = Game.new(player1,player2)
game.start_a_war
