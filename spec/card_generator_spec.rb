require 'rspec'
require './lib/card_generator'

RSpec.describe CardGenerator do 
    it 'opens a file' do 
        card_gen = CardGenerator.new
        expect(card_gen.file).to be_a(File)
    end 

    it 'returns an array of args for Card.new' do
        card_gen = CardGenerator.new
        expect(card_gen.generate_array).to be_a(Array)
        expect(card_gen.card_arguments[0]).to be_a(Array)
        expect(card_gen.card_arguments[0][0]).to eq('2')
        expect(card_gen.card_arguments[0][1]).to eq('Heart')
        expect(card_gen.card_arguments[0][2]).to eq(2)
    end 

    it 'makes a deck of cards' do 
        card_gen = CardGenerator.new
        expect(card_gen.generate_deck).to be_a(Array)
        expect(card_gen.cards[0]).to be_an_instance_of(Card)
        expect(card_gen.cards[0].suit).to eq('Heart')
    end 
end 
