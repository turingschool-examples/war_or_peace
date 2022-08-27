require 'rspec'
require './lib/card'
require './lib/card_generator'

#run these tests from the war_or_peace root directory
RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      filename = "test_cards.txt"
      generator = CardGenerator.new(filename)
      expect(generator).to be_an_instance_of(CardGenerator)
    end
    it 'generates cards' do
      generator = CardGenerator.new("test_cards.txt")
      expect(generator.filename).to eq("test_cards.txt")
      expect(generator.cards[0]).to be_a(Card)
      expect(generator.cards[0].rank).to be_a(Integer)
      expect(generator.cards[0].suit).to be_a(Symbol)
      expect(generator.cards[0].value).to be_a(String)
    end
  end
end
