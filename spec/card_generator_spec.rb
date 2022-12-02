require 'rspec'
require './lib/card'
require './lib/deck' 
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'



RSpec.describe CardGenerator do 
  it 'exists and has a cards text file' do 
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator).to be_a(CardGenerator)
  end

  describe '#load_cards' do 
    it 'reads the file and creates card objects from the file' do 
      card_generator = CardGenerator.new('cards.txt')
      card_generator.load_cards
  
      expect(card_generator.cards.length).to eq(52)
    end
  end
end