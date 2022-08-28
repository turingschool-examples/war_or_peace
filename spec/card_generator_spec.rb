require 'rspec'
require './lib/card_generator'

RSpec.describe Card_Generator do
  describe '#initialize' do
    it 'exists' do
      file_name = 'test.txt'
      card_generator = Card_Generator.new(file_name)

      expect(card_generator).to be_an_instance_of(Card_Generator)
    end

    it 'has a file name' do
      file_name = 'test.txt'
      card_generator = Card_Generator.new(file_name)

      expect(card_generator.file_name).to eq('test.txt')
    end
  end

  describe '#methods' do
    it 'can read a file' do
      file_name = 'test.txt'
      card_generator = Card_Generator.new(file_name)
      # require 'pry'; binding.pry
      expect(card_generator.read_file).to eq("Hello, World\nHello, Turing\n")
    end

    it 'can split a file by line' do
      file_name = 'test.txt'
      card_generator = Card_Generator.new(file_name)
      # require 'pry'; binding.pry
      card_generator.read_file
      expect(card_generator.split_by_line).to eq(['Hello, World', 'Hello, Turing'])
    end

    it 'can split each line by commas' do
      file_name = 'test.txt'
      card_generator = Card_Generator.new(file_name)
      card_generator.read_file
      card_generator.split_by_line
      # require 'pry'; binding.pry
      expect(card_generator.split_line).to eq([["Hello", "World"], ["Hello", "Turing"]])
    end

    it 'can create instances of card for each array within the array' do
      file_name = 'cards.txt'
      card_generator = Card_Generator.new(file_name)
      card_generator.read_file
      card_generator.split_by_line
      card_generator.split_line
      card_generator.create_cards
      # require 'pry'; binding.pry
      expect(card_generator.cards[0]).to be_an_instance_of(Card)
      expect(card_generator.cards[0].suit).to eq('Heart')
      expect(card_generator.cards[0].rank).to eq(2)
      expect(card_generator.cards[0].value).to eq('2')
    end
  end
end
