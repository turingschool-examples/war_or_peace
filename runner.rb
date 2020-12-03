require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

round_count = 0
full_deck = []

suit = {1 => :heart, 2 => :diamond, 3 => :spade, 4 => :club}
card_value = {
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
  14 => 'Ace'}

suit_rank = 1
card_rank = 2

while suit_rank <= 4
  while card_rank <= 14
    full_deck << Card.new(suit[suit_rank], card_value[card_rank], card_rank)
    card_rank += 1
  end
  suit_rank += 1
  card_rank = 2
end

@shuffled_deck = full_deck.shuffle

def deal(player1, player2)
  26.times do
    player1.deck.cards << @shuffled_deck.slice!(0)
    player2.deck.cards << @shuffled_deck.slice!(0)
  end
end

def take_turn
  turn = Turn.new(player1, player2)
  round_count += 1
  turn.type
  turn.winner
  turn.pile_cards
  p "Turn #{@round_count}: #{turn.type} - #{turn.winner.name} won #{turn.spoils_of_war.length} cards."
  turn.award_spoils
end

deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

puts """Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{player1.name} and #{player2.name}.
Type 'GO' to start the game!"""
puts "------------------------------------------------------------------"

deal(player1, player2)

round_count = 1
while player1.has_lost == false && player2.has_lost == false
  turn = Turn.new(player1, player2)
  turn.type
  turn.winner
  if turn.type == :basic
    p "Turn #{round_count}: #{turn.winner.name} won 2 cards. #{player1.deck.cards.length} + #{player2.deck.cards.length}"
  elsif turn.type == :war
    p "Turn #{round_count}: #{turn.winner.name} won 6 cards. #{player1.deck.cards.length} + #{player2.deck.cards.length}"
  else
    p "*mutually assured destruction* 6 cards removed from play #{player1.deck.cards.length} + #{player2.deck.cards.length}"
  end
  turn.pile_cards
  turn.award_spoils
  round_count += 1
  break if player1.has_lost? == true
  break if player2.has_lost? == true
  break if round_count == 1000000
end
 p "We have a winner"
require "pry"; binding.pry
