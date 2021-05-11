require 'rspec'
require_relative '../lib/card'

RSpec.describe Card do
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

  it 'uses default params if no args are supplied' do
    default_card = Card.new

    expect(default_card.suit).to eq(:joker)
    expect(default_card.value).to eq('Joker')
    expect(default_card.rank).to eq(0)

    expect(default_card.suit.class).to be(Symbol)
    expect(default_card.value.class).to be(String)
    expect(default_card.rank.class).to be(Integer)
  end
end
