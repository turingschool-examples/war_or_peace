require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'turn'

class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

  end

  def normalize_value(rank)
    # why couldn't face_values be reached when declared outside the method?
    # method access should include scope above???
    face_values = ['Jack', 'Queen', 'King']
    if rank == 1
      'Ace'
    elsif rank < 11
      rank.to_s
    else
      face_values[rank - 11]
    end
  end

  def build_deck
    suits = [:diamond, :heart, :spade, :club]
    ranks = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new(suit, normalize_value(rank), rank)
        game_deck << card
      end
    end
  end

  def start
    
  end
end
