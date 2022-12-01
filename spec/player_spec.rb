require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    it "exists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)
        player = Player.new('Caleb', deck)
        #require 'pry'; binding.pry
        expect(player).to be_an_instance_of(Player)
    end

    
    it "hasn't lost by default" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)
        player = Player.new('Caleb', deck)
        #require 'pry'; binding.pry
        expect(player.has_lost?).to eq(false)  
    end
    
#     xit "can tell rank of cards" do
#         card1 = Card.new(:diamond, 'Queen', 12)
#         card2 = Card.new(:spade, '3', 3)
#         card3 = Card.new(:heart, 'Ace', 14)

#         cards = [card1, card2, card3]
#         deck = Deck.new(cards)

#         expect(deck.rank_of_card_at(0)).to eq(12)
#         expect(deck.rank_of_card_at(2)).to eq(14)
#     end

#     xit "can determine high cards" do
#         card1 = Card.new(:diamond, 'Queen', 12)
#         card2 = Card.new(:spade, '3', 3)
#         card3 = Card.new(:heart, 'Ace', 14)

#         cards = [card1, card2, card3]
#         deck = Deck.new(cards)
        
#         expect(deck.high_ranking_cards).to eq([card1, card3])
#     end

#     xit "can determine % of high cards" do
#         card1 = Card.new(:diamond, 'Queen', 12)
#         card2 = Card.new(:spade, '3', 3)
#         card3 = Card.new(:heart, 'Ace', 14)
#         cards = [card1, card2, card3]
#         deck = Deck.new(cards)

#         #require 'pry'; binding.pry
#         expect(deck.percent_high_ranking).to eq(66.67)
#     end

#     xit "can remove cards" do
#         card1 = Card.new(:diamond, 'Queen', 12)
#         card2 = Card.new(:spade, '3', 3)
#         card3 = Card.new(:heart, 'Ace', 14)
#         cards = [card1, card2, card3]
#         deck = Deck.new(cards)
#         #require 'pry'; binding.pry

#         expect(deck.remove_card).to eq(card1)
#         expect(deck.cards).to eq([card2, card3])
#         expect(deck.high_ranking_cards).to eq([card3])
#         #require 'pry'; binding.pry
#         expect(deck.percent_high_ranking).to eq(50.0)
#     end
    
#     xit "can add another card" do
#         card2 = Card.new(:spade, '3', 3)
#         card3 = Card.new(:heart, 'Ace', 14)
#         card4 = Card.new(:club, '5', 5)
        
#         cards = [card2, card3]
#         deck = Deck.new(cards)
        
#         #require 'pry'; binding.pry

#         expect(deck.add_card(card4)).to eq([card2, card3, card4])
#         expect(cards).to eq([card2, card3, card4])
#         expect(deck.percent_high_ranking).to eq(33.33)
#     end

 end