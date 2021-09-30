require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Player do
  before :each do
    deck = Deck.new
    @player1 = Player.new('Sally', deck)
    @player2 = Player.new('James', deck)
  end

  it 'exists' do
    turn = Turn.new(@player1, @player2)
    expect(turn).to be_a Turn
  end
end
