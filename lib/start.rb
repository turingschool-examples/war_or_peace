  require 'pry'
  require 'rspec'
  require './lib/deck.rb'
  require './lib/card.rb'
  require './lib/player.rb'
  require './lib/turn.rb'


def go
  suits = [:diamond, :heart, :spade, :club]
  values = [
    ["Two", 2], 
    ["Three", 3],
    ["Four", 4],
    ["Five", 5],
    ["Six", 6],
    ["Seven", 7],
    ["Eight", 8],
    ["Nine", 9],
    ["Ten", 10],
    ["Jack", 11],
    ["Queen", 12],
    ["King", 13],
    ["Ace", 14]
  ]
  deck = []

  values.each do |number_value|
    rank = number_value[1]
    value = number_value[0]
    
    
    deck << Card.new(suits[0], value, rank)
    deck << Card.new(suits[1], value, rank)
    deck << Card.new(suits[2], value, rank)
    deck << Card.new(suits[3], value, rank)
    
  end 
end
go
