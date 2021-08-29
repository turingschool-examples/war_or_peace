require './lib/card.rb'


class Deck
  attr_reader(:cards)
  def initialize(cards)
    @cards = cards
  end

  # def rank_of_card_at(index)
  #   if cards.empty? == false && cards[2] != nil
  #     cards[index].rank
  #   end
  # end
  def rank_of_card_at(index)
    cards[index].rank
  end


  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank >= 11
      high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    percent = ()
    high_cards_count = 0
    cards.each do |card|
      if card.rank >= 11
        high_cards_count += 1
      end
    end
    (100 * high_cards_count.to_f / cards.length.to_f).round(2)
  end


  def remove_card
    @cards.shift
  end

  # def remove_card
  #   if cards.empty? == false
  #     cards.delete_at(0)
  #   end
  # end


  def add_card(card)
    @cards << card
  end

end
