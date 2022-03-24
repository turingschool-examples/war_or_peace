require 'rspec'
require './lib/card_generator'
require './lib/card'

describe 'CardGenerator' do
  it 'exists' do
    cards = CardGenerator.new('test')
    expect(cards).to be_a CardGenerator
  end
  it 'produces an array of 52 cards' do
    filename = './lib/cards.txt'
    cards = CardGenerator.new(filename).cards
    expect(cards.length).to eq(52)
  end
end
