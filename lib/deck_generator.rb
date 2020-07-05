require './lib/card_generator'
require './lib/card'


class DeckGenerator

  attr_accessor :card1, :card, :cards_array

  def initialize
    @card1 = card1
    @counter = 0
    @cards_array = []
  end

  def print_cards
    52.times{
    new_cards = CardGenerator.new("./lib/cards.txt")
    @cards_array.push(Card.new(new_cards.card_values_split[@counter][1], new_cards.card_values_split[@counter][0], new_cards.card_values_split[@counter][2]))
    @counter += 1
  }
    end

    def cards_here
      @cards_array
    end

  end
