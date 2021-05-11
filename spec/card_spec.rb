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

  it 'prevents cheating' do
    real_card1 = Card.new(:Club, 'king', 13)
    expect(real_card1.suit).to eq(:club)
    expect(real_card1.value).to eq('King')
    expect(real_card1.rank).to eq(13)

    real_card2 = Card.new(:spade, '10', 10)
    expect(real_card2.suit).to eq(:spade)
    expect(real_card2.value).to eq('10')
    expect(real_card2.rank).to eq(10)

    fake_card1 = Card.new(:rhinestone, 'Queen', 12)
    expect(fake_card1.suit).to eq(:joker)
    expect(fake_card1.value).to eq('Joker')
    expect(fake_card1.rank).to eq(0)

    fake_card2 = Card.new(:heart, 'Aces', 12)
    expect(fake_card2.suit).to eq(:joker)
    expect(fake_card2.value).to eq('Joker')
    expect(fake_card2.rank).to eq(0)

    fake_card3 = Card.new(:heart, 'Ace', 50)
    expect(fake_card3.suit).to eq(:joker)
    expect(fake_card3.value).to eq('Joker')
    expect(fake_card3.rank).to eq(0)
  end
end
