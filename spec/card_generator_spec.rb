require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it "is an instance of its class" do
    card_generator = CardGenerator.new('cards.txt')
    
    expect(card_generator).to be_an_instance_of(CardGenerator)
  end
  
  it "takes a text file as an argument" do
    card_generator = CardGenerator.new('cards.txt')
    card_generator.sort_file_into_deck
    
    expect(card_generator.cards[0].rank).to eq(2)
    expect(card_generator.cards[0].suit).to eq(:Club)
    expect(card_generator.cards[0].value).to eq("2")
  end
  
  it "creates a deck of 52 cards" do
    card_generator = CardGenerator.new('cards.txt')
    card_generator.sort_file_into_deck
    
    expect(card_generator.cards.count).to eq(52)
  end
end