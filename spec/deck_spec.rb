require './lib/card'
require './lib/deck'


RSpec.describe Deck do
  it "exists" do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    cards = Deck.new(cards)
    expect(cards).to be_an_instance_of(Deck)
  end

  it "create cards" do


  end


  it "Card array" do


    expect(@cards)

  end

  xit "cards array" do

    cards = [card1, card2, card3]

    expect(deck.cards).to eq([card1, card2, card3])
    end

end
