require './lib/deck'


RSpec.describe Deck do
  it "is an instance" do
  deck = Deck.new([])

    expect(card1 ).to be_an_instance_of(Deck)
end
    expect(card1.suit).to eq(:diamond)
    expect(card1.value).to eq('Queen')
    expect(card1.rank).to eq(12)
  end

  it "is an instance of card2" do
  card2 = Card.new(:spade, '3', 3)

    expect(card2).to be_an_instance_of(Card)

    expect(card2.suit).to eq(:spade)
    expect(card2.value).to eq('3')
    expect(card2.rank).to eq(3)
  end

  it "is an instance of card3" do
  card3 = Card.new(:heart, 'Ace', 14)

    expect(card3).to be_an_instance_of(Card)

    expect(card3.suit).to eq(:heart)
    expect(card3.value).to eq('Ace')
    expect(card3.rank).to eq(14)
  end



#

# before :each do
