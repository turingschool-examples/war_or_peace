require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it "exists" do
      game = Game.new
      expect(game).to be_an_instance_of(Game)
    end
    it "successfully creates players" do
      game = Game.new
      expect(game.player1.name).to eq("Will")
      expect(game.player2.name).to eq("GODZILLA")
      expect(game.player1).to be_an_instance_of(Player)
      expect(game.player2).to be_an_instance_of(Player)
    end
    it "has readable turn_count" do
      game = Game.new
      expect(game.turn_count).to eq(0)
    end
  end
  describe '#start' do
    it "successfully displays start message" do
      game = Game.new
      #not sure if this even works
      expect { game.display_start_message }.to output(String).to_stdout
    end
    it "successfully starts game" do
      game = Game.new
      #cant figure out how to get the .start to work by inputting "go"
      allow(game.start).to receive(:gets).and_return('GO')
      require "pry"; binding.pry
      expect(game.turn_count).to be > 0
    end
  end
end
