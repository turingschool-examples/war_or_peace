require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
  before :each do

  end

  it 'exists' do
    deck = []
    player = Player.new("Sally", deck)
  end
end