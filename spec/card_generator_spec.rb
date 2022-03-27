require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

describe 'card_generator' do
  it 'generates a deck from cards.txt' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards).to be_an_instance_of CardGenerator
  end
end
