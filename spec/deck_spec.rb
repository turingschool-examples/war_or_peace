require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Card do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    expect(card1).to be_an_instance_of Card
    expect(card2).to be_an_instance_of Card
    expect(card3).to be_an_instance_of Card
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  # it 'puts cards in array' do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = cards.each do |card|
  #     deck << card
  #   end
  #   deck = Deck.new([card1, card2, card3])
  #   # require 'pry'; binding.pry
  #
  #
  #   expect(deck.cards).to be_an_instance_of Deck
  # end
end
