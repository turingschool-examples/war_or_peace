require 'pry'
require './lib/card'

all_cards = []
values = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
ranks = 1..13
suits = [:hearts, :diamonds, :spades, :clubs]

values.zip(ranks).each do |value, rank|
  suits.each do |suit|
    all_card_arguments = Card.new(suit, value, rank)
    all_cards << all_card_arguments
  end
end

binding.pry







# all_card_arguments << suit
# all_card_arguments << value
# all_card_arguments << rank
