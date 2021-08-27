require "CSV"
require "rspec"
require "./lib/card_generator"

describe CardGenerator do
  describe "#initialize" do
    it "is an instance of CardGenerator" do
      generator = CardGenerator.new("./lib/cards.txt")

      expect(generator).to be_a CardGenerator
    end

    it "has a file" do
      generator = CardGenerator.new("./lib/cards.txt")

      expect(generator.filename).to eq "./lib/cards.txt"
    end
  end

  describe "#cards" do
    it "returns an array with 52 cards" do
      generator = CardGenerator.new("./lib/cards.txt")

      all_cards = generator.cards

      deck = Deck.new(all_cards)

      expect(all_cards).to be_a Array
      expect(deck).to be_a Deck
      expect(deck.cards.count).to eq 52
    end
  end
end
