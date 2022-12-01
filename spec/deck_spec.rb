require './lib/card'
require './lib/deck'


RSpec.describe Deck do
    before(:each) do
       @card1 = Card.new(:diamond, 'Queen', 12)
       @card2 = Card.new(:spade, '3', 3)   
       @card3 = Card.new(:heart, 'Ace', 14)
       @cards = [@card1, @card2, @card3]    
 
       @deck = Deck.new(@cards)
    end
 
   it "exists" do
       expect(@deck).to be_an_instance_of(Deck)
   end
 
   it "has cards" do
       expect(@deck.cards).to eq([@card1, @card2, @card3])
   end
 
   it "accesses card rank" do
       expect(@deck.rank_of_cards_at(0)).to eq(12)
       expect(@deck.rank_of_cards_at(1)).to eq(3)
       expect(@deck.rank_of_cards_at(2)).to eq(14)
   end
 
   it "has high ranking cards" do
       expect(@deck.high_ranking_cards).to eq([@card1, @card3])
   end
 
   it "can get percent of high ranking cards" do
       expect(@deck.percent_high_ranking).to eq(66.67)
   end

   it "can remove a card" do 

        expect(@deck.remove_card).to eq(@card1)
    
        expect(@deck.high_ranking_cards).to eq([@card3])
        expect(@deck.cards).to eq([@card2, @card3])
        expect(@deck.percent_high_ranking).to eq(50.0)
   end

   xit "can add a card" do 
        card4 = Card.new(:club, '5', 5)

        @deck.add_card(card4)
        expect(@deck.cards).to eq([@card2, @card3. card4])
        expect(@deck.high_ranking_cards).to eq(@card3)
        expect(@deck.percent_high_ranking).to eq(33.33)

   end

 
end
