require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/card_generator.rb'

RSpec.describe do
  it 'can generate cards' do
    card_generator = CardGenerator.new('./lib/cards.txt')
    deck = card_generator.cards

    expect(deck[0]).to be_a Card
    expect(deck[0].suit).to eq(:Heart)
    expect(deck[0].value).to eq('2')
    expect(deck[0].rank).to eq(2)

    expect(deck[12].suit).to eq(:Heart)
    expect(deck[12].value).to eq('Ace')
    expect(deck[12].rank).to eq(14)

  end

  it 'generates all the cards' do
    card_generator = CardGenerator.new('./lib/cards.txt')
    deck = card_generator.cards

    expect(deck.size).to eq(52)
  end
end
