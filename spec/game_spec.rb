require 'rspec'
require 'pry'
require './lib'
require './war_or_peace_runner'

Rspec.describe Game do

  it 'creates new turn' do
    expect(turn).to be_an_instance_of(Turn)
  end
