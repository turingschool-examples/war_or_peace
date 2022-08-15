require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Card do

  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14) 
    @card4 = Card.new(:club, '5', 5)
    @deck = Deck.new(cards)
  end 

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do


    cards = ([@card1, @card2, @card3])

    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    expect(@deck.percent_high_ranking).to eq([@card3])

    @deck.add_card(@card4)

  end