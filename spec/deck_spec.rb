require 'rspec'
require 'pry'
require './lib/deck'
require './card'

RSpec.describe Deck do
  before do
    @deck = Deck.new([Card.new(:foo, 'Bar', 9001)])
  end

  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'has readable attributes' do
    expect(@deck.cards[0].suit).to eq(:foo)
    expect(@deck.cards[0].value).to eq('Bar')
    expect(@deck.cards[0].rank).to eq(9001)
  end

  it 'initializes empty array of cards by default' do
    deck = Deck.new
    expect(deck.cards).to_not be_nil
    expect(deck.cards.length).to eq(0)
  end

  it 'returns rank of card at given index' do
    expect(@deck.rank_of_card_at(0)).to eq(9001)
  end

  it 'returns array of high ranking cards' do
    low_ranking_card = Card.new(:foo, 'Bar', 10)
    high_ranking_card1 = Card.new(:foo, 'Bar', 11)
    deck = Deck.new([low_ranking_card, high_ranking_card1])
    deck.high_ranking_cards.each do |card|
      expect(card.rank >= 11).to be(true)
    end

  end

  it 'returns percentage of high ranking cards' do
    low_ranking_card = Card.new(:foo, 'Bar', 1)
    high_ranking_card = Card.new(:foo, 'Bar', 9001)
    deck = Deck.new([low_ranking_card, high_ranking_card, high_ranking_card])
    expect(deck.percentage_high_ranking).to eq(2.0/3.0)
  end

  it 'removes card from top (beginning) of deck' do
    top_card = Card.new(:foo, 'Top', 1)
    middle_card = Card.new(:foo, 'Mid', 2)
    bottom_card = Card.new(:foo, 'Bot', 3)
    deck = Deck.new([top_card, middle_card, bottom_card])

    puts "the deck before removing a card from the top:"
    deck.print_info


    puts "the card that was removed:"
    removed_card = deck.remove_card_from_top
    removed_card.print_info

    puts "the deck after removing the card from the top:"
    deck.print_info
  end

  it 'adds card to bottom (end) of deck' do
    top_card = Card.new(:foo, 'Top', 1)
    middle_card = Card.new(:foo, 'Mid', 2)
    bottom_card = Card.new(:foo, 'Bot', 3)
    deck = Deck.new([top_card, middle_card, bottom_card])

    puts "the deck before adding a card to the bottom:"
    deck.print_info

    puts "the card we will be adding:"
    new_card = Card.new(:foo, 'Bot', 4)
    new_card.print_info
    deck.add_card_to_bottom(new_card)

    puts "the deck after adding a card to the bottom:"
    deck.print_info
  end

  it 'returns top (beginning) card' do
    top_card = Card.new(:foo, 'Top', 1)
    middle_card = Card.new(:foo, 'Mid', 2)
    bottom_card = Card.new(:foo, 'Bot', 3)
    deck = Deck.new([top_card, middle_card, bottom_card])
    expect(deck.top).to eq(top_card)
  end

  it 'returns bottom (end) card' do
    top_card = Card.new(:foo, 'Top', 1)
    middle_card = Card.new(:foo, 'Mid', 2)
    bottom_card = Card.new(:foo, 'Bot', 3)
    deck = Deck.new([top_card, middle_card, bottom_card])
    expect(deck.bottom).to eq(bottom_card)
  end

end
