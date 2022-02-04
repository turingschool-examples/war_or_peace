require_relative 'card'
require_relative 'deck'
require_relative 'player'


def create_deck

  deck = []
  possible_suits = [:diamond, :heart, :spade, :club]
  possible_value = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King', 'Ace']
  value_index = 0
  suits_index = 0
  rank = 2

  until deck.length() == 52
    4.times do
      value_index = 0
      rank = 2
      13.times do
        deck << Card.new(possible_suits[suits_index], possible_value[value_index], rank)
        value_index += 1
        rank += 1
      end
      suits_index += 1
    end
  end

  deck = Deck.new(deck)
  return deck

end

deck1 = create_deck
deck2 = create_deck

player1 = Player.new("Maven", deck1)
player2 = Player.new("Adam", deck2)

puts player1
puts player2
