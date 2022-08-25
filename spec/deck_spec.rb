require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card1) { Card.new(:diamond, 'Queen', 12) }
  let(:card2) { Card.new(:spade, '3', 3) }
  let(:card3) { Card.new(:heart, 'Ace', 14) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }

  it 'should have a deck class and hold 3 cards: card1,card2, card3' do
    expect(deck).to be_an_instance_of Deck
    expect(deck.cards.count).to eq 3
    expect(deck.cards).to eq ([card1, card2, card3])
  end

# deck.rank_of_card_at(0)
# #=> 12

# deck.rank_of_card_at(2)
# #=> 14

# deck.cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

# deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]

# deck.percent_high_ranking
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