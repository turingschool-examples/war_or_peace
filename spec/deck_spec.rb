require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before :each do
    card1 = Card.new(:diamond, 'Jack', 11 )
    card2 = Card.new(:heart, 'Eight', 8 )
    @cards = [card1, card2]
  end

  it "exists" do
    cards = []
    deck = Deck.new(@cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'can read cards' do
    deck = Deck.new(@cards)
    expect(deck.cards).to eq(@cards)
  end

  it 'can return rank of card at' do
    deck = Deck.new(@cards)
    expect(deck.rank_of_card_at(0).to eq(@cards[0].rank))
    expect(deck.rank_of_card_at(1).to eq(@cards[1].rank))
  end

  
end