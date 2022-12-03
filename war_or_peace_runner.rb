require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/cards'
card_values = Cards::CARD_VALUES
suits = Cards::SUITS

deck = suits.map do |suit|
    card_values.map do |card_value|
        rank = card_values.find_index(card_value) + 2
        Card.new(suit, card_value.to_s, rank)
    end
end.flatten

require 'pry'; binding.pry