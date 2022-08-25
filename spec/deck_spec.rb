require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:card4) { Card.new(:spade, '10', 10) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }

  it 'has a deck class' do
    expect(deck).to be_an_instance_of Deck
  end
  
  it 'should return the instance variable cards, which holds 3 cards: card1,card2, card3' do
    expect(deck.cards.count).to eq 3
    expect(deck.cards).to eq ([card1, card2, card3])
    expect(deck.cards).not_to include (card4)
  end

  it 'returns the rank of each card' do 
    expect(deck.rank_of_card_at(0)).to eq 12
    expect(deck.rank_of_card_at(2)).to eq 14
  end 

  it 'is able to return only face cards' do 
    # require 'pry';binding.pry
    expect(deck.high_ranking_cards).to eq ([card1, card3])
    expect(deck.high_ranking_cards).not_to eq ([card2, card4])
  end

  it 'return the percentage of cards that are high ranking' do
    require 'pry';binding.pry
    expect(deck.percent_high_ranking).to eq 66.67
  end
  # #=> 66.67

# deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">

# deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

# deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]

# deck.percent_high_ranking
# #=> 50.0

# card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">

# deck.add_card(card4)

# deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]

# deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]

# deck.percent_high_ranking
# #=> 33.33


end