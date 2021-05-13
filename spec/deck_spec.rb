require './lib/deck'
require './lib/card'

# Check to see if empty array exists for cards
RSpec.describe Deck do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  xit "has empty array" do
    card = Card.new(:diamond, 'Queen', 12)
    expect(Deck.cards).to eq([])
  end

  it 'Removes card' do
    card = Card.new(:diamond, 'Queen', 12)
    card1 = Card.new(:heart, 'Jack', 11)
    cards.remove_card
    expect(@cards.count).to eq(1)
  end
end
