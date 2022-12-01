require 'rspec'
require './lib/card'

RSpec.describe Card do
  describe "Make Cards" do

  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    expect(card).to be_an_instance_of(Card)
  end

  # Now I see this was an ind test; the test below tests for all attributes
  # Therefore this does the same thing as below and is not needed.
  # it 'has a suit' do
  #   card = Card.new(:diamond, 'Queen', 12)
  #   expect(card.suit).to eq(:diamond)
  # end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  end
end
