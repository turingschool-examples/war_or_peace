require 'pry'
require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'

RSpec.describe Deck do
  it "exists" do
    deck1 = Deck.new("cards")
    expect(deck1).to be_an_instance_of(Deck)
  end
  
  it "deck is an array" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck1 = Deck.new("cards")
  
    expect deck1 = [cards]
    
  end
  
  it "displays rank of card" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new("cards")
    binding.pry
    
    expect deck.rank_of_card_at(0).to eq (12)
  end 
  
end
