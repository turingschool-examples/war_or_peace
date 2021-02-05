
class Deck
  attr_accessor :cards

  def initialize (cards)
    @cards = cards
  end


  def rank_of_card_at(index)
    @cards[index].rank
  end


  def high_ranking_cards
    cards.select do |card|
     card.rank > 11
    end
  end



  def percent_high_ranking
    high_rank = cards.select do |card|
     card.rank > 11
    end
     (high_rank.length.to_f/cards.length.to_f).round(3) * 100
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.append(card)
  end
end
