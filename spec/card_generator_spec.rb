require 'rspec'
require './lib/card_generator'
require './lib/card'

describe 'CardGenerator' do
  it 'exists' do
    cards = CardGenerator.new('test')
    expect(cards).to be_a CardGenerator
  end
  it 'produces an array of 52 cards' do
    filename = './cards.txt'
    cards = CardGenerator.new(filename).cards
    expect(cards.length).to eq(52)
  end
  it 'only contains instances of the card class' do
    filename = './cards.txt'
    cards = CardGenerator.new(filename).cards
    expect(cards.all? { |e| e.instance_of?(Card) }).to eq(true)
  end
end
