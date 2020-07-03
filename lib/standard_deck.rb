require_relative "./card"

class StandardDeck
  attr_reader :cards

  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
  SUITS = [:heart, :diamond, :spade, :club]
  def initialize
    create_deck
  end

  def create_deck
    @cards = []
    rankings = (2..14).to_a
    SUITS.each do |suit|
      ranks_and_values = rankings.zip(VALUES)
      ranks_and_values.each do |rank, value|
          @cards << Card.new(suit, value, rank)
      end
      @cards.shuffle
    end
  end
end
