require 'pry'
require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'


RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck1 = Deck.new(cards)
    
    expect(deck1).to be_an_instance_of(Deck)
  end
  
  it "deck.cards = array" do
    deck1 = Deck.new([])
    expect(deck1.cards).to eq([])
  end
  
  
  
  it "deck is an array" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck1 = Deck.new(cards)
  
    expect(deck1.cards).to eq(cards) 
    
  end
  
  it "displays rank of card" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new(cards)
    
    expect(deck.rank_of_card_at(0)).to eq(12)
  end 
  
  it "array of face cards" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new(cards)
    
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end 
  
  it "percentof high ranking cards" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new(cards)
    
    deck.high_ranking_cards
    
    expect(deck.percent_high_ranking).to eq(66.67)
  end 
  
  
  it "removes a card" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new(cards)
    # binding.pry
    expect(deck.remove_card).to eq(card1)
  end 
  
  
  it "add a card" do 
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    
    cards = [card1, card2, card3]
    
    deck = Deck.new(cards)
    
    deck.add_card(card4)
    
    expect(cards.include?(card4)).to eq(true)
  end 
  
  
  
  
  
end
