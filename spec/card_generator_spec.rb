require './lib/card_generator'
require './lib/card'
require 'rspec'

describe CardGenerator do
    describe 'initialize' do

        it 'can passes a file as an arguement' do
            filename = 'cards.txt'
            cards = CardGenerator.new(filename)

            expect(cards.file).to be_a File
        end

        it 'can read the file' do
            filename = File.open('cards.txt')
            cards = CardGenerator.new(filename)
            expect(cards.read_file).to include("2, Heart, 2", "3, Heart, 3","4, Heart, 4", "5, Heart, 5", "6, Heart, 6", "7, Heart, 7","8, Heart, 8", "6, Club, 6", "7, Club, 7", "8, Club, 8", "9, Club, 9", "10, Club, 10", "Jack, Club, 11", "Queen, Club, 12", "King, Club, 13", "Ace, Club, 14")
        end

        it 'can create instances for each card' do
            filename = File.open('cards.txt')
            cards = CardGenerator.new(filename)

            expect(cards.cards).to include(Card)
        end
    end
end