require 'rspec'
require './lib/card_generator'

RSpec.describe CardGenerator do 
    it 'opens a file' do 
        filename = 'cards.txt'
        cards = CardGenerator.new(filename)
        expect(cards.file).to be_a(File)
    end 

    it 'makes a deck of cards' do 
        filename = 'cards.txt'
        cards = CardGenerator.new(filename)
        expect(cards.generate_deck).to be_a(Array)
        expect(cards.cards[0]).to be_an_instance_of(Card)
        expect(cards.cards[0].suit).to eq(:heart)
    end 
end 
