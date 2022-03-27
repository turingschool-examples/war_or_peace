require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards).to be_an_instance_of(CardGenerator)
  end

  it 'can generate cards' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.all?{ |card| card.instance_of?(Card)}).to eq(true)
  end
end
