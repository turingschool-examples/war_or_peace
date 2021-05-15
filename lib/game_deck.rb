require './lib/deck'

class GameDeck
  attr_reader :deck

  def initialize
    @deck = Deck.new([])
  end

  def build_game_deck
    suits = [:heart, :diamond, :spade, :club]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

    suits.each do |suit|
      ranks.each do |rank|
        @deck.cards << Card.new(suit, values[rank - 2], rank)
      end
    end
  end
end
