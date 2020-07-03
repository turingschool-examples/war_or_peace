require './lib/card'

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
