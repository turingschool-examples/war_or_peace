require 'rspec'
require './lib/card'
require './lib/card_generator'
require 'pry'

RSpec.describe Card_Generator do

  it "exists" do
    file_name = './lib/cards.txt'
    @generator = Card_Generator.new(file_name)
    expect(@generator).to be_an_instance_of(Card_Generator)
  end

  it "generates 52 cards" do
    file_name = './lib/cards.txt'
    @generator = Card_Generator.new(file_name)
    expect(@generator.cards.length).to eq(52)
  end


end
