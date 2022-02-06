require 'rspec'
require './lib/card'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it "exists" do
    filename = "cards.txt"
    create_deck = CardGenerator.new(filename)

    expect(create_deck).to be_an_instance_of(CardGenerator)
  end

  xit "has has cards" do
    
    filename = "cards.txt"
    create_deck = CardGenerator.new(filename)
    cards = CardGenerator.new(filename).cards

    expect(cards).to eq()
  end
end
