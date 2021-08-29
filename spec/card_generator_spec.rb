require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/card_generator.rb'

RSpec.describe do
  it 'can generate cards' do
    filename = './lib/cards.txt'
    card_generator = CardGenerator.new(filename)
    data = card_generator.cards

    expect(data[0]).to eq(['2', ' Heart', 2])

  end
end
