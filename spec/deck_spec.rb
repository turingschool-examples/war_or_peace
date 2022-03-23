require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new([])
    expect(deck).to be_an_instance_of(Deck)
  end

  xit 'gives card at index 0' do
    deck = Deck.new([])
    card = Card.new(:diamond, 'Queen', 12)
    card = Card.new(:spade, '3', 3)
    card = Card.new(:heart, 'Ace', 14)
    expect(card.rank_of_card_at).to eq(12)
  end

  xit 'are high ranking cards' do
    deck = Deck.new([])
    card = Card.new(:diamond, 'Queen', 12)
    card = Card.new(:spade, '3', 3)
    card = Card.new(:heart, 'Ace', 14)
    expect(high_ranking_cards).to eq() #Not sure what to make it equal to yet 3/23
  end

end
