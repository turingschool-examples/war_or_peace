# require 'rspec'
# require './lib/start'
# require 'pry'

# RSpec.describe Start do
#     before :each do
#         @card1 = Card.new(:diamond, 'Queen', 12)
#         @card2 = Card.new(:spade, '3', 3) 
#         @card3 = Card.new(:heart, 'Ace', 14)  
#         @card4 = Card.new(:diamond, 'Jack', 11) 
#         @card5 = Card.new(:heart, '8', 8)  
#         @card6 = Card.new(:diamond, 'Queen', 12) 
#         @card7 = Card.new(:heart, '3', 3) 
#         @card8 = Card.new(:diamond, '2', 2)    
#         @deck1 = Deck.new([@card1, @card2, @card5,])
#         @deck2 = Deck.new([@card4, @card6, @card7])
#         @player1 = Player.new('V', @deck1)
#         @player2 = Player.new('Michelle', @deck2)
#         @game = Start.new("")
#     end 
#   it 'starts' do
#     greeting = 
#      "Welcome to War! (or Peace) This game will be played with 52 cards.\n"+
#      "The players today are V and Michi.\n"
#      "------------------------------------------------------------------"
     
#     expect(@game.start_game(@player1,@player2)).to eq(greeting)
#   end 
#   it 'starts game' do
#     expect(@game.call_turns(@player1, @player2)).to be_an_instance_of(Turn)
#   end 
# end 