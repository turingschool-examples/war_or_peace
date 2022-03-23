class Deck

  attr_reader :cards

  def initialize(card)
    @cards = card
  end

  def rank_of_card_at(location)
    return cards[location].rank
  end

  def high_ranking_cards
    #step through each element of my cards array
    #and return a new array with only the cards that contain values >= 11
    high_cards = []
    cards.each do |card|
      if card.rank >= 11
        # require 'pry'; binding.pry
        high_cards.push card
      end
    end
    return high_cards
  end




end
