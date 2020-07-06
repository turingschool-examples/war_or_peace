require './lib/card_generator'
require './lib/card'


class DeckGenerator

  attr_accessor :counter, :cards_array

  def initialize
    @counter = 0
    @cards_array = []
  end

  def return_all_cards
    52.times{
    new_deck_of_cards = CardGenerator.new("./lib/cards.txt")
    @cards_array.push(Card.new(new_deck_of_cards.card_values_split[@counter][1], new_deck_of_cards.card_values_split[@counter][0], new_deck_of_cards.card_values_split[@counter][2]))
    @counter += 1
  }
    end

    def cards_stacked_here
      @cards_array
    end

  end
