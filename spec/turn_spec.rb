require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

Rspec.describe Turn do
  it #initializes" do
    card1 = Card.new(:heart, 'Jack', 11) 
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)