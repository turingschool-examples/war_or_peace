require 'rspec'
require './lib/card'
require './lib/deck'

describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  describe '#rank_of_card_at' do
    xit 'shows rank of card' do
      card = Card.new(:diamond, 'Queen', 12)
      card.rank_of_card_at(0)
      expect(card).to eq()
    end
  end
end

