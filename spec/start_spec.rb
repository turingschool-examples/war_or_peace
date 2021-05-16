require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/start'

describe Start do
  it 'is an istance of Start' do
    start = Start.new

    expect(start).to be_an_instance_of(Start)
  end

  context 'methods' do
    it 'has a greeting' do
      start = Start.new
      start.greeting

      expect(start.greeting).to eq("Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------\n")
    end

    it 'evaluates user input' do
      start = Start.new
      start.begin_game('begin')

      expect(start.begin_game('begin')).to eq("Invalid response:\nPlease try again and type 'GO'")
    end
  end
end
