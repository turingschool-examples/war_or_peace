require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new(@cards)
    expect(deck).to be_an_instance_of(Deck)
  end

describe "cards" do
  it 'can read the cards' do
    deck = Deck.new(@cards)
    expect(deck.cards).to eq(@cards)
  end

#   describe '#rank_of_card_at' do
#   it "returns rank of card" do
#     deck = Deck.new(@cards)
#     expect(deck.rank_of_card_at).to eq(index)
#    end
#   end
  end
end
