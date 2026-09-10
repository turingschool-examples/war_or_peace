require 'rspec'
require '../lib/card'
require '../lib/deck'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Deck do 
  it "exists" do 
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '10', 10)
    card3 = Card.new(:spade, 'Ace', 14)

    expect(card1).to be_an_instance_of(Card)
    expect(card2).to be_an_instance_of(Card)
    expect(card3).to be_an_instance_of(Card)
  end

  it "can store cards in an array" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '10', 10)
    card3 = Card.new(:spade, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.cards).to eq([card1, card2, card3])
  end

  it 'returns card rank via array indices' do 
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '10', 10)
    card3 = Card.new(:spade, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(3)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it 'returns high ranking cards' do 
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '10', 10)
    card3 = Card.new(:spade, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.percent_high_ranking).to eq(33.33)
  end

  it "can remove a players card from there deck" do
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '10', 10)
    card3 = Card.new(:spade, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expect(deck.remove_card).to eq(card1)
  end

  it "can add a card to a players deck" do 
    card1 = Card.new(:heart, '3', 3)
    card2 = Card.new(:diamond, '10', 10)
    card3 = Card.new(:spade, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    deck.remove_card

    card4= Card.new(:club, '5', 5)

    deck.add_card(card4)

    expect(deck.cards).to eq([card2, card3, card4])    
  end
end