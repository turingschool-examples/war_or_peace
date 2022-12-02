require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    describe 'initialize' do
      it "exists" do
        turn = turn.new
        
        expect(player).to be_an_instance_of(Player)
      end
    end
end