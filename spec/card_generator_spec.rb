# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe CardGenerator do
  before :each do
    @generator = CardGenerator.new('cards.txt')
  end

  it 'exists' do
    expect(@generator).to be_an_instance_of(CardGenerator)
  end

  it 'can generate cards correctly' do
    card1 = @generator.cards[0]

    expect(card1.rank).to eq(2)
    expect(card1.suit).to eq(:Heart)
    expect(card1.value).to eq('2')
  end

  it 'does not generate the wrong card' do
    card1 = @generator.cards[0]

    expect(card1.rank).not_to eq(14)
    expect(card1.suit).not_to eq(:Spade)
    expect(card1.value).not_to eq('Ace')
  end

  it 'can generate correct amount of cards' do
    expect(@generator.cards.length).to eq(52)
  end
end
