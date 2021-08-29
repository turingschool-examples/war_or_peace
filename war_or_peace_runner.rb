require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player'
require './lib/turn'

suits = [:heart, :club, :diamond, :spade]
ranks_and_values = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
                    "8" => 8, "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12,
                    "King" => 13, "Ace" => 14}

deck_of_cards = []

suits.each do |suit|
  ranks_and_values.each do |value, rank|
    deck_of_cards << Card.new(suit, value, rank)
  end
end

deck_of_cards = deck_of_cards.shuffle

first_deck = []
26.times do |card|
  first_deck << deck_of_cards.delete_at(0)
end

second_deck = []
26.times do |card|
  second_deck << deck_of_cards.delete_at(0)
end

# bad_card = Card.new(:heart, "Card", 1)

deck1 = Deck.new(first_deck)
deck2 = Deck.new(second_deck)

player1 = Player.new("Micha", deck1)
player2 = Player.new("Jen", deck2)

turn = Turn.new(player1, player2)

turn.start
