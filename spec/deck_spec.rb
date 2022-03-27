require 'pry'
require './lib/card'
require './lib/deck'

describe Deck do
  let(:card1){Card.new(:diamond, 'Queen', 12)}
  let(:card2){Card.new(:spade, '3', 3)}
  let(:card3){Card.new(:heart, 'Ace', 14)}
  let(:card4){Card.new(:club, '5', 5)}
  let(:deck){Deck.new([card1, card2, card3])}
  it "exists" do

    expect(deck).to be_an_instance_of(Deck)

  end

  it "has an array of cards" do

    expect(deck.cards).to eq([card1, card2, card3])

  end

  it "can return the rank of card at" do

     expect(deck.rank_of_card_at(0)).to eq(12)
     expect(deck.rank_of_card_at(2)).to eq(14)

   end


  it "can return high ranking cards" do

    expect(deck.high_ranking_cards).to eq([card1, card3])
   end


  it "can return the percentage of cards that are high ranking " do

    expect(deck.percent_high_ranking).to eq(66.67)
   end

   it "can remove a card" do

     expect(deck.cards).to eq([card1, card2, card3])
     deck.remove_card
     expect(deck.cards).to eq([card2, card3])
   end

   it "can add a card" do

     expect(deck.cards).to eq([card1, card2, card3])
     deck.add_card(card4)

     expect(deck.cards).to eq([card1,card2, card3, card4])
   end

   it "can run through the full itteration pattern" do
     expect(deck.cards).to eq([card1, card2, card3])
     expect(deck.rank_of_card_at(0)).to eq(12)
     expect(deck.rank_of_card_at(2)).to eq(14)
     expect(deck.high_ranking_cards).to eq([card1, card3])
     expect(deck.percent_high_ranking).to eq(66.67)
     deck.remove_card
     expect(deck.cards).to eq([card2, card3])
     expect(deck.high_ranking_cards).to eq([card3])
     expect(deck.percent_high_ranking).to eq(50.00)
     deck.add_card(card4)
     expect(deck.cards).to eq([card2, card3, card4])
     expect(deck.high_ranking_cards).to eq([card3])
     expect(deck.percent_high_ranking).to eq(33.33)
   end




end
