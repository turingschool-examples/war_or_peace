require_relative 'spec_helper'

RSpec.describe Deck do
  before :each do
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
    expect(@deck.cards).to eq(@cards)
  end

  it "it can return card value at given index" do
    expect(@deck.rank_of_card_at(0)).to eq(12)
    expect(@deck.rank_of_card_at(2)).to eq(14)
  end

  it "can return high ranking cards" do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it "can add cards" do
    card4 = Card.new(:club, '5', 5)
    expect(@deck.add_card(card4)).to eq(@cards)
  end
end


# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 66.67
#
# pry(main)> deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 50.0
#
# pry(main)> card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">
#
# pry(main)> deck.add_card(card4)
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 33.33
