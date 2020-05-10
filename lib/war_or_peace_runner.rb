require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require 'pry'

# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3)
# card3 = Card.new(:heart, 'Ace', 14)
# cards = [card1, card2, card3]
# deck = Deck.new(cards)
# player = Player.new('Clarisa', deck)

card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)
deck1 = Deck.new([card1, card2, card5, card8])
deck2 = Deck.new([card3, card4, card6, card7])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

card_values = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
card_values_with_rank = []
card_values.each_with_index do |value, index|
  rank = index + 2
  card_values_with_rank << {value: value => rank: rank}
end

cards_in_full_deck = {
  :spade => card_values_with_rank,
  :club => card_values_with_rank,
  :heart => card_values_with_rank,
  :diamond => card_values_with_rank,
}

def all_cards
  arr = []
  cards_in_full_deck.each do |suit, arr_of_hash|
    arr_of_hash.each {|a| arr << Card.new(suit, a[:value], a[:rank]) }
  end
  arr
end


turn = Turn.new(player1, player2)

a = [1,2,3,4,5]
b = []

b << a.delete_at(0)
b << a.delete_at(0)
puts "a: #{a}"
puts "b: #{b}"
