require './lib/card_generator'

RSpec.describe CardGenerator do
  it "can create objects" do
    cards = CardGenerator.new

    expect(cards).to be_an_instance_of(CardGenerator)
  end
end
