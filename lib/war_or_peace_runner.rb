require './lib/card'
require './lib/deck'
require './lib/player'

class Game

  attr_reader

  def initialize


  end
  suits = %i[heart club diamond spade]
  values = { "2" => 2,
             "3" => 3,
             "4" => 4,
             "5" => 5,
             "6" => 6,
             "7" => 7,
             "8" => 8,
             "9" => 9,
            "10" => 10,
          "Jack" => 11,
         "Queen" => 12,
          "King" => 13,
           "Ace" => 14}

  def card_values
    values.map do |value|
      Card.new(suit, value)
    end
  end

  def add_rank
    suits.map do |suit|
        card_values
      end
  end

require "pry"; binding.pry












end
