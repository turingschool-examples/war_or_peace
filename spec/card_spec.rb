require 'rspec'
require './lib/card'
require 'deck'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  it "has no cards when created" do
    deck = Deck.new
    expect(deck.sim_deck).to be_empty
  end

   it "can have a card in a deck" do
      deck = Deck.new
      card = Card.new(:heart, 'Jack', 11)

      deck.add_card(card)
      expect(deck.sim_deck.count).to eq (1)
   end

   it "can have multiple cars in a deck" do
    deck = Deck.new
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)

    deck.add_card(card_1)
    deck.add_card(card_2)
    deck.add_card(card_3)

    expect(deck.sim_deck.count).to eq(3)
   end

   it 'can call rank' do
    deck = Deck.new
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)

    deck.add_card(card_1)
    deck.add_card(card_2)
    deck.add_card(card_3)

    deck.rank_of_card_at(card_1)
    deck.rank_of_card_at(card_3)

    expect(card_1.rank).to eq (12)
    expect(card_3.rank).to eq (14)

   end

  it 'can check for high ranking cards' do
    deck = Deck.new
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    card_4 = Card.new(:club, 'King', 13)
    card_5 = Card.new(:diamond, '7', 7)
    card_6 = Card.new(:heart, '8', 8)

    deck.add_card(card_1)
    deck.add_card(card_2)
    deck.add_card(card_3)
    deck.add_card(card_4)
    deck.add_card(card_5)
    deck.add_card(card_6)

    expect(deck.sim_deck.count).to eq(6)
    expect(deck.high_ranking_cards.count).to eq(3)
    expect(deck.high_ranking_cards).to eq([card_1, card_3, card_4])
  end

end
