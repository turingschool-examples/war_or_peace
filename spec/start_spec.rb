require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

describe Start do
  it 'is an istance of Start' do
    start = Start.new(greeting)

    expect(start).to be_an_instance_of(Start)
  end

  it 'has a greeting' do
    start = Start.new(greeting)
    
    expect(greeting).to eq("Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------\n")
  end
end
