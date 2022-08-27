require "rspec"
require "./lib/card_generator"

RSpec.describe CardGenerator do 
  describe "#initialize" do 
    it "exists" do 
      filename = "cards.txt"
      card_generator = CardGenerator.new(filename)
      expect(card_generator).to be_a CardGenerator
    end

    it "creates readable cards" do 
      filename = "cards.txt" 
      cards = CardGenerator.new(filename).cards
      expect(cards.length).to eq 52
      hearts = cards[0..12]
      clubs = cards[13..25]
      diamonds = cards[26..38]
      spades = cards[39..51]
      values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
      hearts.each_with_index do |card, i|
        expect(card.rank).to eq(i + 2)
        expect(card.suit).to eq :heart
        expect(card.value).to eq values[i]
      end 
      clubs.each_with_index do |card, i|
        expect(card.rank).to eq(i + 2)
        expect(card.suit).to eq :club
        expect(card.value).to eq values[i]
      end
      diamonds.each_with_index do |card, i|
        expect(card.rank).to eq(i + 2)
        expect(card.suit).to eq :diamond
        expect(card.value).to eq values[i]
      end
      spades.each_with_index do |card, i|
        expect(card.rank).to eq(i + 2)
        expect(card.suit).to eq :spade 
        expect(card.value).to eq values[i]
      end
    end
  end
end