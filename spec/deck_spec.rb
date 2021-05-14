require '../lib/card'
require '../lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end
  it "is a deck that contains cards" do

    expect(@deck).to be_an_instance_of(Deck)
    expect(@deck.cards).to eq([@card1, @card2, @card3])

  end

  it "can tell the card rank" do

    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)

  end

  it "is high ranking card" do

    expect(@deck.high_ranking_cards.count).to eq(2)

  end

  it "can tell percentage of high ranking cards" do

    expect(@deck.percent_high_ranking).to eq(66.67)

  end

  it "can remove card from deck" do

    @deck.remove_card

    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.percent_high_ranking).to eq(50)
  end

  it "can add card to deck" do
    @deck.remove_card

    card4 = Card.new(:club, '5', 5)

    @deck.add_card(card4)

    expect(@deck.cards).to eq([@card2, @card3, card4])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end
