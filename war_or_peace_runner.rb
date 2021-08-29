
card1_1 = Card.new(:heart, '2', 2)
card1_2 = Card.new(:heart, '9', 9)
card1_3 = Card.new(:heart, 'Ace', 14)
card1_4 = Card.new(:heart, '5', 5)
card2_1 = Card.new(:spade, 'Jack', 11)
card2_2 = Card.new(:spade, '3', 3)
card2_3 = Card.new(:spade, '8', 8)
card2_4 = Card.new(:spade, 'Queen', 12)
cards1 = ([card1_1, card1_2, card1_3, card1_4])
cards2 = ([card2_1, card2_2, card2_3, card2_4])

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

player1 = Player.new('Nick', deck1)
player2 = Player.new('Melissa', deck2)
