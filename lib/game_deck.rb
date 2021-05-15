require './lib/deck'
require './lib/player'

class GameDeck

  def build_game_deck
    suits = [:heart, :diamond, :spade, :club]
    values = ['2', '3', '3', '5', '6', '7', '8', '9', 'Jack', 'Queen', 'King', 'Ace']
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

    suits.each do |suit|
      ranks.length.times do |rank|
        deck << Card.new(suit, values[rank], rank)
      end
    end
  end
end 
