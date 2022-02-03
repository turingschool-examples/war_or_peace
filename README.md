## War or Peace

This is the starter repo for the BE Mod1 **War or Peace** project.


2/2 9:24pm : made it through percent_high_ranking in interaction pattern, also complete corresponing test. start on add_card method tomorrow.
2/3 8:30am : fixed high_ranking_cards and percent_high_ranking to work with different deck states/amount of cards in deck. added remove_card method, re-did and completed new tests for everything over.  next: start/finish add_card (beginning is commented out)

2/3 1:42 : fixed high_ranking_cards and percent_high_ranking to work with add_card and remove_card. just need to write tests for them



Xpry(main)> require './lib/card'
#X> true

Xpry(main)> require './lib/deck'
#=> true

Xpry(main)> card1 = Card.new(:diamond, 'Queen', 12)
#=> #<Card:0x007fbfd18490e8...>

Xpry(main)> card2 = Card.new(:spade, '3', 3)    
#=> #<Card:0x007fbfd19f4fa0...>

Xpry(main)> card3 = Card.new(:heart, 'Ace', 14)    
#=> #<Card:0x007fbfd18555a0...>

Xpry(main)> cards = [card1, card2, card3]

Xpry(main)> deck = Deck.new(cards)
#=> #<Deck:0x007fbfd2984808 @cards=[#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]>

Xpry(main)> deck.cards
#=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

Xpry(main)> deck.rank_of_card_at(0)
#=> 12

Xpry(main)> deck.rank_of_card_at(2)
#=> 14

Xpry(main)> deck.cards
#=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

Xpry(main)> deck.high_ranking_cards
#=> [#<Card:0x007fbfd18490e8...>, #<Card:0x007fbfd18555a0...>]

Xpry(main)> deck.percent_high_ranking
#=> 66.67

Xpry(main)> deck.remove_card
#=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">

Xpry(main)> deck.cards
#=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]

xpry(main)> deck.high_ranking_cards
#=> [#<Card:0x007fbfd18555a0...>]

xpry(main)> deck.percent_high_ranking
#=> 50.0

xpry(main)> card4 = Card.new(:club, '5', 5)
#=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">

xpry(main)> deck.add_card(card4)

xpry(main)> deck.cards
#=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]

xpry(main)> deck.high_ranking_cards
#=> [#<Card:0x007fbfd18555a0...>]

xpry(main)> deck.percent_high_ranking
#=> 33.33
