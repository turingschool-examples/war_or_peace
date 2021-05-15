require './lib/deck'

class GameDeck
  attr_reader :game_deck

  def initialize
    @game_deck = []
  end

  def build_game_deck
    suits = [:heart, :diamond, :spade, :club]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

    suits.each do |suit|
      ranks.each do |rank|
        @game_deck << Card.new(suit, values[rank - 2], rank)
      end
    end
  end
end
