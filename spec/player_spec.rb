require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  before :each do

  end

  it 'exists' do
    player = Player.new("Sally", Deck.new)
  end
  
  it 'has attributes' do
    player = Player.new("Sally", Deck.new)
    expect(player.name).to eq("Sally")
    expect(player.deck).to be_a(Deck)
    expect(player.deck.cards.size).to eq(52)
  end
end