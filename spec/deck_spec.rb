require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do

 it "exists" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)
   deck.add_to_deck(card1)
   deck.add_to_deck(card2)
   deck.add_to_deck(card3)
   expect(deck).to be_an_instance_of(Deck)
   expect(deck.cards).to eq([card1, card2, card3])
   end

   it "adds to deck" do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
   end

   it "has high_ranking_cards method" do
     expect(deck.high_ranking_cards).to eq([@card1, @card3])
   end

   it "has percent_high_ranking method" do
     expect(deck.rank_of_card_at(0).to eq(12))
     expect(deck.rank_of_card_at(2).to eq(14))
   end
 end


#    def rank_of_card_at(card)
#        expect(rank_of_card_at).to eq(0..2)
#       end
#
#    def high_ranking_cards
#      @high_ranking_cards = [11, 12, 13, 14]
#    end
# end
     # cards = [card1, card2, card3]
     #
     # card1.add_to_deck(card1)
     # card2.add_to_deck(card2)
     # card3.add_to_deck(card3)
