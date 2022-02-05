require 'pry'
require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'
require './lib/turn.rb'
require './lib/card_maker.rb'


p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!"

# input = gets.chomp
# 
# if input == "Go"
  puts "Lets start"

  cards = card_maker
  half = []
  cards.shuffle!
  26.times do
    half << cards.pop
  end
  
  deck1 = Deck.new(cards)
  deck2 = Deck.new(half)
 
  
  player1 = Player.new("Megan", deck1)
  binding.pry
  player2 = Player.new("Aurora", deck2)
  
  
  
  
  
