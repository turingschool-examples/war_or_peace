require 'rspec'
require './lib/deck'
require './lib/card'
# require 'pry';binding.pry
 RSpec.describe Deck do

   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]

   it 'is made up of an array of cards' do
     deck = Deck.new(cards)
     expect(deck.cards).to eq([card1, card2, card3])
   end

   it 'can determine card ranking & percentage of high ranking cards' do
     deck = Deck.new(cards)
     deck.high_ranking_cards
     expect(deck.rank_of_card_at(0)).to eq(12)
     expect(deck.high_ranking_cards).to eq ([card1, card3])
     expect(deck.percent_high_ranking).to eq (66.67)
   end

   it 'can remove and add cards' do
     deck = Deck.new(cards)
     deck.high_ranking_cards
     deck.remove_card
     expect(deck.rank_of_card_at(0)).to eq(3)
     expect(deck.percent_high_ranking).to eq (50.0)
     card4 = Card.new(:club, '5', 5)
     deck.add_card(card4)
     expect(deck.rank_of_card_at(2)).to eq(5)
     expect(deck.percent_high_ranking).to eq (33.33)
   end

 end
