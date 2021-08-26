require 'rspec'
require './lib/deck'

describe Deck do

  describe "#initialize" do
    it "is an instance of Deck" do
      cards = [[:spade, '3', 3], [:diamond, 'Queen', 12], [:club, '5', 5]]
      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end
  end

  describe "attr_reader" do
    it "has readable attributes" do
      cards = [[:diamonds, 'ace', 14],
               [:diamonds, 'king', 13],
               [:diamonds, 'queen', 12],
               [:diamonds, '2', 2],
               [:diamonds, '3', 3],
               [:diamonds, '6', 6]
              ]
      deck = Deck.new(cards)
      expect(deck.cards).to eql([[:diamonds, 'ace', 14],
                                 [:diamonds, 'king', 13],
                                 [:diamonds, 'queen', 12],
                                 [:diamonds, '2', 2],
                                 [:diamonds, '3', 3],
                                 [:diamonds, '6', 6]
                                ]
                               )
    end
  end

  describe "#rank_of_card_at" do
    context "given 0"
      it "returns the 3rd item in the first item in the array" do
        cards = [[:spade, '3', 3], [:diamond, 'Queen', 12], [:club, '5', 5]]
        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(0)).to eq(3)
      end
  end

  describe "#high_ranking_cards" do
    it "returns an array of cards rank 11 or above" do
      cards = [[:diamonds, 'ace', 14],
               [:diamonds, 'king', 13],
               [:diamonds, 'queen', 12],
               [:diamonds, '2', 2],
               [:diamonds, '3', 3],
               [:diamonds, '6', 6]
              ]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to include([:diamonds, 'ace', 14],
                                                  [:diamonds, 'king', 13],
                                                  [:diamonds, 'queen', 12]
                                                 )
    end
  end

  describe "#percent_high_ranking" do
    it "returns the percentage of cards that are high ranking" do
      cards = [[:diamonds, 'ace', 14],
               [:diamonds, 'king', 13],
               [:diamonds, 'queen', 12],
               [:diamonds, '2', 2],
               [:diamonds, '3', 3],
               [:diamonds, '6', 6]
              ]
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(50.0)
    end
  end

  describe "#remove_card" do
    it "removes the first card in the instance object array" do
      cards = [[:diamonds, 'ace', 14],
               [:diamonds, 'king', 13],
               [:diamonds, 'queen', 12],
               [:diamonds, '2', 2],
               [:diamonds, '3', 3],
               [:diamonds, '6', 6]
              ]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq([:diamonds, 'ace', 14])
    end
  end

  describe "#add_card" do
    it "adds a card object to the end of the instance object array" do
      cards = [[:diamonds, 'ace', 14],
               [:diamonds, 'king', 13],
               [:diamonds, 'queen', 12],
               [:diamonds, '2', 2],
               [:diamonds, '3', 3],
               [:diamonds, '6', 6]
              ]
      deck = Deck.new(cards)
      card7 = [:clubs, '5', 5]
      expect(deck.add_card(card7)).to eq([[:diamonds, 'ace', 14],
                                          [:diamonds, 'king', 13],
                                          [:diamonds, 'queen', 12],
                                          [:diamonds, '2', 2],
                                          [:diamonds, '3', 3],
                                          [:diamonds, '6', 6],
                                          [:clubs, '5', 5]
                                         ]
                                        )
    end
  end
end
