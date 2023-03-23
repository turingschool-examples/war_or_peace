require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/card_generator"

RSpec.describe CardGenerator do 
  it "#initializes" do
    cards = CardGenerator.new("cards.txt")
    expect(cards).to be_an_instance_of(CardGenerator)
  end
  it "converts text file to card deck" do

    card_gen = CardGenerator.new("cards.txt").cards

    expect(card_gen).to be_a(Array)
    expect(card_gen.first).to be_an_instance_of(Card)
  end
end