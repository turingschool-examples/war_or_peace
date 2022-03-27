require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

Rspec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
  end
end
