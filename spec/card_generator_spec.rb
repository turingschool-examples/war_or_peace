require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
RSpec.describe CardGenerator do
  it "exists" do
    filename = "cards.txt"
    info = CardGenerator.new(filename)
    expect(info).to be_an_instance_of(CardGenerator)
  end

  it "reads file" do
    filename = "cards.txt"
    info = CardGenerator.new(filename)
    expect(info.cards.length).to eq(52)
  end
end
