require './lib/card'
require 'pry'


class Deck
  attr_reader :cards

  def initialize(cards)
  @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

def high_ranking_cards
  eleven_deck = []
  @cards.each do |card|
      if card.rank >= 11
      eleven_deck << card
    end
  end
  return eleven_deck

end


end
