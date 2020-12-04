require './lib/card'

class StandardDeck
  attr_reader :cards,
              :deck1,
              :deck2

  def initialize
    @cards = []
    @suits = [:heart, :diamond, :spade, :club]
    @values_ranks = {values: ['2','3','4','5','6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'],
                    ranks: [2, 3, 4, 5, 6, 7 ,8, 9, 10, 11, 12, 13, 14]}
  end

  def create_standard_deck
    @suits.each do |suit|
      13.times do |num|
        add_card(Card.new(suit.to_sym, @values_ranks[:values].at(num), @values_ranks[:ranks].at(num)))
      end
    end
  end

  def add_card(card)
    @cards << card
  end
end
