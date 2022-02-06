require './lib/card_generator'

RSpec.describe CardGenerator do
  it "can create cards" do

  filename = "cards.txt"

  cards = CardGenerator.new(filename).cards

  expect(cards).to be_an_instance_of(CardGenerator)
  end
end
