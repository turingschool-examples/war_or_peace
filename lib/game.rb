require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'
require_relative 'game'

class Game
  attr_reader :cards

  def initialize()
    @cards = Array.new
    @suits = [:heart, :spade, :diamond, :club]
    @values_and_ranks = {
      'Ace': 14,
      'King': 13,
      'Queen': 12,
      'Jack': 11,
      :numeric => (2..10)
    }

    @suits.each do |suit|
      @values_and_ranks.each do |value, rank|
        if value != :numeric
          @cards << Card.new(suit, value, rank)
        elsif value == :numeric
          rank.each do |rank|
            @cards << Card.new(suit, rank.to_s, rank)
          end
        end

      end
    end
  end


end
