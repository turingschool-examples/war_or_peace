require './lib/card'
require './lib/deck'
require './lib/player'


# Generating the standad deck
card_ranks = (2..14).to_a
high_card_values = { 11 => "Jack", 12 => "Queen", 13 => "King", 14 => "Ace" }
suits = [:heart, :spade, :club, :diamond]

standard_deck = card_ranks.map do |rank|
  suits.map do |suit|
    if rank < 11
      Card.new(suit, rank.to_s, rank)
    else
      Card.new(suit, high_card_values[rank], rank)
    end
  end
end.flatten!

# Generating Decks
random_deck = standard_deck.shuffle!
random_deck_split = random_deck.each_slice(26).map { |deck_half| deck_half }

cards1 = random_deck_split[0]
cards2 = random_deck_split[1]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

# Generate Players
player1 = Player.new("Linda", deck1)
player2 = Player.new("Bob", deck2)


require 'pry'; binding.pry
