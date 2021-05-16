require './lib/card'

RSpec.describe Card do
  it "is an instance of card" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card).to be_an_instance_of(Card)
  end

  it "has a suit" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card.suit).to eq(:heart)
  end

  it "has a value" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card.value).to eq('Jack')
  end

  it "has a rank" do
    card = Card.new(:heart, 'Jack', 11)
    expect(card.rank).to eq(11)
  end
end
