require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

def create_suit(suit)
  suit_cards = []
  values = {
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => '10',
    11 => 'Jack',
    12 => 'Queen',
    13 => 'King',
    14 => 'Ace'
  }
  rank = 2

  while rank <= 14 do
    p rank
    suit_cards << Card.new(suit, values[rank], rank)
    rank += 1
  end

  suit_cards
end

suits = ['heart', 'spade', 'diamond', 'club']

cards = suits.reduce([]) { |cards, suit| cards.concat(create_suit(suit)) }

p cards
