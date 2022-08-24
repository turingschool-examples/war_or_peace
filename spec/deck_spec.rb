require 'rspec'
require './lib/deck'

RSpec.describe Deck do 
  it 'is an instance of deck' do 
    deck_1 = Deck.new
    expect(deck_1).to be_instance_of Deck
  end 
  
  it 'has cards' do 
    deck_1 = Deck.new
    expect(deck_1.cards).to eq([]) 
  end 

  it 'represents the index location of a card' do 
    deck_1 = Deck.new
    deck_1.rank_of_card_at("card1") 
    expect()
  end      

  # xit 'returns an array of high ranking cards' do 
  #   deck_1 = Deck.new(["card1", "card2"])

  # end 

  # xit 'returns percentage cards of high ranking card' do
  #   deck_1 = Deck.new(["card1", "card2"])
  #   deck_1.rank_of_card_at(0)
  # end 

end 