require 'rspec'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    # @cards - see if this should be a separate method and we should replace @array_of_cards
  end

  # def rank_of_card_at([])


end
