require './lib/card'
#=> true

require './lib/deck'
#=> true

card1 = Card.new(:diamond, 'Queen', 12)
#=> #<Card:0x007fbfd18490e8...>

card2 = Card.new(:spade, '3', 3)
#=> #<Card:0x007fbfd19f4fa0...>

card3 = Card.new(:heart, 'Ace', 14)
#=> #<Card:0x007fbfd18555a0...>

cards = [card1, card2, card3]

deck = Deck.new(cards)
#=> #<Deck:0x007fbfd2984808 @cards=[#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]>

deck.cards
#=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

#pry(main)> deck.rank_of_card_at(0)
#=> 12

#pry(main)> deck.rank_of_card_at(2)
#=> 14
