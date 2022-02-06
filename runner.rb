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
  player2 = Player.new("Aurora", deck2)
  counter = 0
  
  
  until (player1.has_lost? == true || player2.has_lost? == true) || counter == 1000000
    counter += 1

    turn = Turn.new(player1, player2)
    winner = turn.winner
     turn.pile_cards
     unless turn.type == :mutually_assured_destruction
       turn.award_spoils(winner)
     end
     
     
     if turn.type == :mutually_assured_destruction 
       puts "#{counter} #{turn.type.upcase}! #{turn.spoils_of_war.count} Cards have been burned!!"
     else 
      puts "#{counter} #{turn.type.upcase}! #{turn.spoils_of_war.count} Cards have been awarded to #{turn.winner.name}!!"
     end 
     # binding.pry
   end 
   
   
   
   puts "#{winner.name} joyously throws cards around the room shouting '52 card pickup, Loser!'"
