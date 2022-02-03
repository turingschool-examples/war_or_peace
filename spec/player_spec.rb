require 'pry'
require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/player.rb'




RSpec.describe Player do
  
  it "exists" do
    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(player)
  end
  
