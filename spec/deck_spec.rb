require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'

RSpec.describe Deck do
# Test whether or not new object belogs to class
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_a(Deck)
  end

  it 'has attributes' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  # describe "#rank_of_card_at" do
  #   xit "returns rank of card at index location" do
  #     rank_of_card(2)
  #     # Needs to iterate over @cards array, find the :rank of the
  #     # card, and return said rank.
  #   end
  # end
  #
  #
  # describe '#high_ranking_cards' do
  #   xit "returns an array of cards" do
  #
  #     high_ranking_cards = @cards.map do |card|
  #       @card >= 11
  #     end
  #
  #     expect(high_ranking_cards).to be_an_instance of(Array)
  #   end
  # end
  #
  # describe '#percent_high_ranking' do
  #   xit "returns percentage of cards in deck that are >= 11" do
  #
  #   end
  # end
  #
  # describe '#remove_card' do
  #   it "removes a card from the top/front of the cards array" do
  #     card1 = Card.new('diamond', 'Queen', 12)
  #     card2 = Card.new('spade', '3', 3)
  #
  #     @cards = [card1, card2]
  #
  #     @cards.shift
  #
  #     expect(@cards).to match_array([card2])
  #
  #   end
  # end
  #
  # describe '#add_card' do
  #   it "add's a card to the end/bottom of the cards array" do
  #     @cards = []
  #     card1 = Card.new('diamond', 'Queen', 12)
  #     @cards.push(card1)
  #
  #     expect(@cards).to include(card1)
  #   end
  # end
end
