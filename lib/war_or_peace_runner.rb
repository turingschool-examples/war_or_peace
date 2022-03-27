require './lib/turn'



dealer_deck = Deck.new([
Card.new(:heart, '2', 2),
Card.new(:heart, '3', 3),
Card.new(:heart, '4', 4),
Card.new(:heart, '5', 5),
Card.new(:heart, '6', 6),
Card.new(:heart, '7', 7),
Card.new(:heart, '8', 8),
Card.new(:heart, '9', 9),
Card.new(:heart, '10', 10),
Card.new(:heart, 'Jack', 11),
Card.new(:heart, 'Queen', 12),
Card.new(:heart, 'King', 13),
Card.new(:heart, 'Ace', 14),
Card.new(:spade, '2', 2),
Card.new(:spade, '3', 3),
Card.new(:spade, '4', 4),
Card.new(:spade, '5', 5),
Card.new(:spade, '6', 6),
Card.new(:spade, '7', 7),
Card.new(:spade, '8', 8),
Card.new(:spade, '9', 9),
Card.new(:spade, '10', 10),
Card.new(:spade, 'Jack', 11),
Card.new(:spade, 'Queen', 12),
Card.new(:spade, 'King', 13),
Card.new(:spade, 'Ace', 14),
Card.new(:diamond, '2', 2),
Card.new(:diamond, '3', 3),
Card.new(:diamond, '4', 4),
Card.new(:diamond, '5', 5),
Card.new(:diamond, '6', 6),
Card.new(:diamond, '7', 7),
Card.new(:diamond, '8', 8),
Card.new(:diamond, '9', 9),
Card.new(:diamond, '10', 10),
Card.new(:diamond, 'Jack', 11),
Card.new(:diamond, 'Queen', 12),
Card.new(:diamond, 'King', 13),
Card.new(:diamond, 'Ace', 14),
Card.new(:clubs, '2', 2),
Card.new(:clubs, '3', 3),
Card.new(:clubs, '4', 4),
Card.new(:clubs, '5', 5),
Card.new(:clubs, '6', 6),
Card.new(:clubs, '7', 7),
Card.new(:clubs, '8', 8),
Card.new(:clubs, '9', 9),
Card.new(:clubs, '10', 10),
Card.new(:clubs, 'Jack', 11),
Card.new(:clubs, 'Queen', 12),
Card.new(:clubs, 'King', 13),
Card.new(:clubs, 'Ace', 14)])


def deal_cards
  deck1 = Deck.new
  deck2 = Deck.new
  if index/2 == 0
    deck1.push(card)
  else
    deck2.push(card)
  end
end

def shuffle(deck)
  deck.each do |card|
  x = deck[index]
  y = deck[pos]
  deck[pos] = x
  deck[index] = y
  end
  return deck
end

dealer_deck = shuffle(dealer_deck)


p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!"
p "------------------------------------------------------------------"
