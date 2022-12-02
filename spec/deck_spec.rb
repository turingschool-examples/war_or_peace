require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
it 'exists' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)
# require 'pry'; binding.pry
    cards_arr = [card1, card2, card3]

    deck = Deck.new(cards_arr)
    expect(cards_arr).to eq([card1, card2, card3])
  end
end

RSpec.describe Deck do
it 'uses index to return rank' do

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
# require 'pry'; binding.pry
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end
end

RSpec.describe Deck do
it 'will return high ranking cards' do
# this method will return an array of cards in the deck that have a rank of 11 or above (face cards and aces)
  
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)
  
      cards = [card1, card2, card3]
  
      deck = Deck.new(cards)

      expect(deck.high_ranking_cards).to eq([card1, card3])
  end
end

RSpec.describe Deck do
  xit 'will return percentage high ranking cards' do

      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14)
  
      cards = [card1, card2, card3]
  
      deck = Deck.new(cards)

      expect(deck.percent_high_ranking).to eq(66.67 )
  end
end