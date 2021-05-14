require 'rspec'
require_relative '../lib/card'
require_relative '../lib/deck'

RSpec.describe Deck do
  it 'can exist as an "empty" or a "non-empty" deck' do
    empty_deck = Deck.new

    expect(empty_deck).to be_an_instance_of(Deck)
    expect(empty_deck.cards).to eq([])
    expect(empty_deck.cards.length).to eq(0)
    expect(empty_deck.rank_of_card_at(0)).to be(nil)
    expect(empty_deck.high_ranking_cards.length).to eq(0)
    expect(empty_deck.percent_high_ranking).to eq(0.0)
    expect(empty_deck.remove_card).to be(nil)


    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])
    expect(deck.cards.length).to eq(3)

    expect(deck.cards[0].suit).to eq(:diamond)
    expect(deck.cards[0].value).to eq('Queen')
    expect(deck.cards[0].rank).to eq(12)

    expect(deck.cards[1].suit).to eq(:spade)
    expect(deck.cards[1].value).to eq('3')
    expect(deck.cards[1].rank).to eq(3)

    expect(deck.cards[2].suit).to eq(:heart)
    expect(deck.cards[2].value).to eq('Ace')
    expect(deck.cards[2].rank).to eq(14)
  end

  it 'can only be created with valid cards' do
    fake_deck = Deck.new([10, 20, 30])

    expect(fake_deck).to be_an_instance_of(Deck)
    expect(fake_deck.cards).to eq([])
    expect(fake_deck.cards.length).to eq(0)
    expect(fake_deck.rank_of_card_at(0)).to be(nil)
    expect(fake_deck.high_ranking_cards.length).to eq(0)
    expect(fake_deck.percent_high_ranking).to eq(0.0)
    expect(fake_deck.remove_card).to be(nil)
  end

  it 'can return the rank of a card at a given index' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(1)).to eq(3)
    expect(deck.rank_of_card_at(2)).to eq(14)
    expect(deck.rank_of_card_at(-1)).to eq(14)
    expect(deck.rank_of_card_at(-2)).to eq(3)
    expect(deck.rank_of_card_at(-3)).to eq(12)

    expect(deck.rank_of_card_at(3)).to be(nil)
  end

  it 'can return high ranking cards and the corresponding percent of total' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    expect(deck.cards.length).to eq(3)
    expect(deck.high_ranking_cards.length).to eq(2)

    expect(deck.high_ranking_cards[0].suit).to eq(:diamond)
    expect(deck.high_ranking_cards[0].value).to eq('Queen')
    expect(deck.high_ranking_cards[0].rank).to eq(12)
    expect(deck.high_ranking_cards[1].suit).to eq(:heart)
    expect(deck.high_ranking_cards[1].value).to eq('Ace')
    expect(deck.high_ranking_cards[1].rank).to eq(14)

    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove a card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    expect(deck.cards.length).to eq(3)
    expect(deck.high_ranking_cards.length).to eq(2)
    expect(deck.percent_high_ranking).to eq(66.67)

    expect(deck.remove_card.suit).to eq(:diamond)
    expect(deck.cards.length).to eq(2)
    expect(deck.high_ranking_cards.length).to eq(1)
    expect(deck.percent_high_ranking).to eq(50.00)
  end

  it 'can add a card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    expect(deck.cards.length).to eq(3)
    expect(deck.high_ranking_cards.length).to eq(2)
    expect(deck.percent_high_ranking).to eq(66.67)

    expect(deck.remove_card.suit).to eq(:diamond)
    expect(deck.cards.length).to eq(2)
    expect(deck.high_ranking_cards.length).to eq(1)
    expect(deck.percent_high_ranking).to eq(50.00)

    deck.add_card(Card.new(:club, '5', 5))
    expect(deck.cards.length).to eq(3)
    expect(deck.high_ranking_cards.length).to eq(1)
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end
