require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end


  def add_card(card)
    @cards.push(card)
  end

  def remove_card
    @cards.shift
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards

    output = []

    cards.each do|card|
      if card.rank >= 11
        output << card
      end
    end
    #below line is return value
    output
  end

  def percent_high_ranking
      (high_ranking_cards.count / @cards.count.to_f * 100).ceil(2)
  end
end
