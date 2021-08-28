require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

describe CardGenerator do
  describe '#initialize' do
    it 'generates a filename equal to cards.txt' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.filename).to eq("cards.txt")
    end

    it 'generates an empty array' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.card_array).to eq([])
    end
  end
  describe '#cards' do
    it 'generates an array of cards' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename).cards

      expect(cards).to be_a(Array)
    end
    it 'generates a 52-object array' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename).cards

      expect(cards.length).to eq(52)
    end
  end
end
