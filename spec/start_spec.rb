require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

RSpec.describe Start do
    it 'it exists' do
        start = Start.new

        expect(start).to be_an_instance_of(Start)
    end
end