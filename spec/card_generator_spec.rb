require 'rspec'
require 'pry'
require './lib/card_generator'

RSpec.describe CardGenerator do

  it "exists" do
    open_box = CardGenerator.new
    expect(open_box).to be_an_instance_of CardGenerator
  end

  it "makes all 52 cards" do
    here_we_go = CardGenerator.new
    here_we_go.make_cards
    here_we_go.make_cards
    expect(here_we_go.cards.length).to be(52)
  end
end
