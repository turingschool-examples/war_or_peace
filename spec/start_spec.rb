require 'rspec'
require './lib/start'
require './lib/turn'
require './lib/card'
require './lib/player'
require './lib/deck'
require 'pry'

RSpec.describe Start do
  # it 'greets' do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3) 
  #   card3 = Card.new(:heart, 'Ace', 14)  
  #   card4 = Card.new(:diamond, 'Jack', 11) 
  #   card5 = Card.new(:heart, '8', 8)  
  #   card6 = Card.new(:diamond, 'Queen', 12) 
  #   card7 = Card.new(:heart, '3', 3) 
  #   card8 = Card.new(:diamond, '2', 2)    
  #   deck1 = Deck.new([card1, card2, card5,])
  #   deck2 = Deck.new([card4, card6, card7])
  #   player1 = Player.new('V', deck1)
  #   player2 = Player.new('Michelle', deck2)
  #   game = Start.new(player1,player2)
  #   greeting = 
  #    "Welcome to War! (or Peace) This game will be played with 52 cards.\n"+
  #    "The players today are #{player1.name} and #{player2.name}.\n"
  #    "------------------------------------------------------------------"
     
  #   expect(game.greeting).to eq(greeting)
  # end 
  it 'starts first turn' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    card5 = Card.new(:heart, '8', 8)  
    card6 = Card.new(:club, 'Queen', 12) 
    card7 = Card.new(:heart, '3', 3) 
    card8 = Card.new(:diamond, '2', 2)    
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card6, card7])
    deck3 = Deck.new([card1, card2, card5])
    deck4 = Deck.new([card6, card4, card7])
    deck5 = Deck.new([card1, card5, card2])
    deck6 = Deck.new([card6, card4, card7])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    game1 = Start.new(player1,player2)
    
    expect(game1.first_round).to eq('V won 2 cards')
    player3 = Player.new('Mike', deck3)
    player4 = Player.new('Sally', deck4)
    game2 = Start.new(player3,player4)
    expect(game2.first_round).to eq('Mike won 6 cards')
    player5 = Player.new('Bran', deck5)
    player6 = Player.new('Jon Snow', deck6)
    game3 = Start.new(player5,player6)
    expect(game3.first_round).to eq('*mutually assured destruction* 6 cards removed from play')
  end 
end 