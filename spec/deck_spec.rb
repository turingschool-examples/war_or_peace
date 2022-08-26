require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
it "exists" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)
   expect(deck).to be_an_instance_of(Deck)
   expect(deck.cards).to eq([card1, card2, card3])
   end

    it "checks a cards rank based on the cards index postion" do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)
     expect(deck.cards).to eq([card1, card2, card3])
     deck.rank_of_card_at(0)
     expect(deck.rank_of_card_at(1)).to eq(3)

  end


     it "will return an array of cards in the deck with an rank >= 11" do
       card1 = Card.new(:diamond, 'Queen', 12)
       card2 = Card.new(:spade, '3', 3)
       card3 = Card.new(:heart, 'Ace', 14)
       cards = [card1, card2, card3]
       deck = Deck.new(cards)
       deck.high_ranking_cards
       expect(deck.high_ranking_cards).to eq([card1, card3])

     end
end
     # it "has a percent_high_ranking method" do
     #   expect(@deck.high_ranking_cards).to eq(@card1, @card3)
     # end

  # it "contains cards" do
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  # end

   # describe "rank_of_card_at"
   # it "returns the rank of that card" do
   #   deck_1 = Deck.new(@cards)
   #   expect(deck_1.rank_of_card_at(0).to eq(12))
   #   expect(deck_1.rank_of_card_at(2).to eq(14))
   # end

   # it "adds to deck" do
   #   card1 = Card.new(:diamond, 'Queen', 12)
   #   card2 = Card.new(:spade, '3', 3)
   #   card3 = Card.new(:heart, 'Ace', 14)
   # end



   # it "has high_ranking_cards method" do
   #   card1 = Card.new(:diamond, 'Queen', 12)
   #   card2 = Card.new(:spade, '3', 3)
   #   card3 = Card.new(:heart, 'Ace', 14)
   #   cards = [card1, card2, card3]
   #   deck = Deck.new(cards)
   #   deck.high_ranking_cards
   #   expect(deck.high_ranking_cards).to eq([card1, card3])
   #   require "pry";binding.pry
   # end

 #   it "has percent_high_ranking method" do
 #     expect(deck.rank_of_card_at(0).to eq(12))
 #     expect(deck.rank_of_card_at(2).to eq(14))
 #   end


 # deck.add_to_deck(card1)
 # deck.add_to_deck(card2)
 # deck.add_to_deck(card3)
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
