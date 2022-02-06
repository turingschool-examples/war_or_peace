require 'pry'
require './lib/card'
require './lib/card_generator'


gen_cards = CardGenerator.new('./cards.txt')
deck = gen_cards.cards
puts deck
