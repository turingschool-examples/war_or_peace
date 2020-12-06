require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


def make_deck
  shuffled_deck = []
  suits = [:diamond, :heart, :spade, :club]
  #Use to_a() to use all numbers in given range
  value = (2..14).to_a
    suits.collect do |value|
      rank.collect do |num|
        if x > 1 && x < 11
          shuffled_deck << Card.new(suit, "#{num}", num)
        elsif num == 11
          shuffled_deck << Card.new(suit, "Jack", num)
        elsif num == 12
          shuffled_deck << Card.new(suit, "Queen", num)
        elsif num == 13
          shuffled_deck << Card.new(suit, "King", num)
        elsif num == 14
          shuffled_deck << Card.new(suit, "Ace", num)
        end
      end
    end
    deck = shuffled_deck[0..51]
end
