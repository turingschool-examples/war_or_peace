require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/player'
require_relative '../lib/turn'
require_relative '../lib/game'

describe '#initialize' do
  it "exists" do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it 'has a complete fulldeck' do
    game = Game.new
    

    expect().to be()
  end

  it 'has two half decks' do
    game = Game.new

    expect().to be()
  end


  it 'has a start' do
    game = Game.new

    expect().to be()
  end

  it 'has a play' do
    game = Game.new

    expect().to be()
  end

  it 'has a game_end' do
    game = Game.new

    expect().to be()
  end
end
