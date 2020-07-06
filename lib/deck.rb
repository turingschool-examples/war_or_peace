require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(location)
    @cards[location].rank
  end

  def high_ranking_cards
    result_deck = []
    @cards.each do |card|
      if card.rank >= 11
        result_deck << card
      end
    end
    result_deck
  end

  def percent_high_ranking
    number_of_cards = @cards.count
    high_ranking_cards = 0
    @cards.each do |card|
      if card.rank >= 11
        high_ranking_cards += 1
      end
    end
    results = high_ranking_cards.to_f / number_of_cards * 100
    results.round(2)
  end

  def remove_card
   @cards.shift
  end

  def add_card(new_card)
    @cards.concat(new_card)
  end
end
