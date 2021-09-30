require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before :each do
    suits = %i[diamond heart spaid club]
    card_names = %w[
      Two
      Three
      Four
      Five
      Six
      Seven
      Eight
      Nine
      Ten
      Jack
      Queen
      King
      Ace
    ]

    @full_deck = []
    suits.each do |suit|
      card_names.each_with_index do |name, index|
        card = Card.new(suit, name, index + 2)
        @full_deck << card
      end
    end

    card1 = Card.new(:diamond, 'Jack', 11)
    card2 = Card.new(:heart, 'Eight', 8)
    @cards = [card1, card2]
  end

  it 'exists' do
    deck = Deck.new(@cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'can read cards' do
    deck = Deck.new(@cards)
    expect(deck.cards).to eq(@cards)
  end

  it 'can return rank of card at' do
    deck = Deck.new(@cards)
    expect(deck.rank_of_card_at(0)).to eq(@cards[0].rank)
    expect(deck.rank_of_card_at(1)).to eq(@cards[1].rank)
  end

  it 'can return high ranking cards' do
    deck = Deck.new(@full_deck)
    expect(deck.high_ranking_cards.size).to eq(16)
  end
  
  it 'can return percent high ranking' do
    deck = Deck.new(@full_deck)
    expect(deck.percent_high_ranking).to eq(16/52.0)
  end
  
  it 'can remove top card' do
    deck = Deck.new(@full_deck)
    expect(deck.cards[0].value).to eq("Two")
    expect(deck.cards.size).to eq(52)
    deck.remove_card
    expect(deck.cards[0].value).to eq("Three")
    expect(deck.cards.size).to eq(51)
  end

  it 'can add a card to end (bottom) of deck' do
    deck = Deck.new(@full_deck)
    expect(deck.cards.last.value).to eq("Ace")
    discard = deck.remove_card
    expect(deck.cards.size).to eq(51)
    expect(deck.cards.last.value).to eq("Ace")
    deck.add_card(discard)
    expect(deck.cards.last.value).to eq("Two")
  end
end
