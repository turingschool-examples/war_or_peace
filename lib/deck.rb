class Deck
  attr_reader :cards, :new_card, :high_ranking_cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank # represent index location of a card to be used
  end

  def high_ranking_cards
    @high_ranking_cards = []
    cards.each_with_index do |card, index| # for this card at this index
      if rank_of_card_at(index) >= 11
        @high_ranking_cards << card
      end
    end
    return @high_ranking_cards
  end

  def percent_high_ranking
    total_cards = cards.count
    cards.each do |percent|
    percent_high_ranking = (high_ranking_cards / total_cards) * 100
    end
    puts percent_high_ranking
  end

  def remove_card
    cards.delete_at(0)
  end

  def add_card(new_card)
    cards.append(new_card)
  end
end
