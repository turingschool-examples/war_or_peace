require 'pry'
class Deck



  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end


  def rank_of_card_at(location)
    return cards[location].rank
  end

  def high_ranking_cards
    high_ranking_card_array = []
    cards.each do |card|

      if card.rank > 10

        high_ranking_card_array.push(card)
      end

    end
    high_ranking_card_array
  end


  def percent_high_ranking
    (high_ranking_cards.length.to_f / cards.length.to_f).round(4) * 100
  end

  def remove_card
    @remove_card = cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
