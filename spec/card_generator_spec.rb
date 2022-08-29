require 'rspec'
require 'json'
require 'pry'
require './lib/card'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    card_generator = CardGenerator.new

    expect(card_generator).to be_an_instance_of(CardGenerator)
  end

  it 'defaults to no cards' do
    card_generator = CardGenerator.new

    expect(card_generator.cards).to eq(nil)
  end

  it 'can have cards passed in' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, 'Ten', 10)
    card_generator = CardGenerator.new([card_1, card_2])

    expect(card_generator.cards).to eq([card_1, card_2])
  end

  it 'can generate a full deck of cards' do
    card_generator = CardGenerator.new
    card_generator.run

    expect(card_generator.cards.length).to eq(52)
    expect(card_generator.cards[0].suit).to eq(:spade)
    expect(card_generator.cards[0].rank).to eq(14)
    expect(card_generator.cards[-1].suit).to eq(:club)
    expect(card_generator.cards[-1].rank).to eq(2)
  end

  it 'can convert txt file <=> array' do
    card_generator = CardGenerator.new

    card_generator.run
    card_generator.save_deck
    card_generator.load_deck
    expect(card_generator.cards.length).to eq(52)
  end
end