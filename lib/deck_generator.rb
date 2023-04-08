require './lib/card'
require './lib/deck'

class DeckGenerator
  attr_accessor :array_of_cards, :deck

  def initialize
    @array_of_cards = []
    @deck = nil
  end

  def generate_deck
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

    values_and_ranks = values.zip(ranks)

    values_and_ranks.map do |x|
      array_of_cards << [x, :diamond].flatten
      array_of_cards << [x, :heart].flatten
      array_of_cards << [x, :spade].flatten
      array_of_cards << [x, :club].flatten
    end

    @array_of_cards = array_of_cards.map do |x|
      Card.new(x[2], x[0], x[1])
    end

    @deck = Deck.new(@array_of_cards)
  end

  def shuffle_the_deck
    @deck.shuffle!
  end
end
