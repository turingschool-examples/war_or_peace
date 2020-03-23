require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


deck = []
suits = [:heart, :diamond, :spade, :club]
ranks = (2..14).to_a

rank_value_pairs = {}
ranks.each  {|rank|
  key = rank
  value = rank.to_s
    if value == "11"
      value = "Jack"
    elsif value == "12"
      value = "Queen"
    elsif value == "13"
      value = "King"
    elsif value == "14"
      value = "Ace"
    end
  rank_value_pairs[key] = value
}

suits.each {|suit|
    rank_value_pairs.each do |rank, value|
    deck << Card.new(suit, value, rank)
  end}
