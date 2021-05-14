require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

#[(:suit, value, rank)]
[
  (:diamond, '2', 2),
  (:diamond, '3', 3),
  (:diamond, '4', 4),
  (:diamond, '5', 5),
  (:diamond, '6', 6),
  (:diamond, '7', 7),
  (:diamond, '8', 8)
]

def create_diamonds
  diamonds = []
  diamond_value = '1'
  diamond_rank = 1
  diamonds = loop do
    each_diamond =
    :diamond
    diamond_value = ((diamond_value.to_i) + 1).to_s
    diamond_rank += 1

    #diamonds << [:diamond, diamond_value, diamond_rank]
    if diamond_rank == 10
      break
    end
  p diamonds
end
