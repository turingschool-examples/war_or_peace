require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require 'pry'

def create_cards
  @suits = [:heart, :diamond, :club, :spade]
  @card_values= {
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
  @initial_deck = []
  @suits.each do |suit|
    @card_values.each do |card_value, card_key|
        @initial_deck << Card.new(suit, card_value, card_key)
    end
  end
end

def create_decks
  shuffled_deck = @initial_deck.shuffle
  @deck1 = []
  @deck2 = []
  52.times do |num|
    if num.even?
      @deck1 << shuffled_deck[num]
    elsif num.odd?
      @deck2 << shuffled_deck[num]
    end
    shuffled_deck.slice(num)
  end
end

def create_players
  @Jenny = Player.new("Jenny", @deck1)
  @Marisa = Player.new("Marisa", @deck2)
end

def start_game
end

def take_turn
  turn = Turn.new(@Jenny, @Marisa)
  binding.pry
  winner = turn.winner
  #turn.pile_cards
end

create_cards
create_decks
create_players
start_game
x = 0
#while x <= 1000 do
  take_turn
#  x += 1
#end
#
# p @deck1.count
# p @deck2.count
# @deck1.each do |card|
#   p card
# end
