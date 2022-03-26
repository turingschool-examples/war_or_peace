class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    # highrankers = []
    # cards.each do |card|
    #    if card.rank >= 11
    #     highrankers << card
    #    end
    # end
    # highrankers
    cards.select do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    # percent_high_rankers = []
    # cards.each do |card|
    #   if card.rank >= 11
    #     percent_high_rankers << card
    #   end
    # end
    # x = percent_high_rankers.float
    # y = cards.float
    #   return x / y
      (high_ranking_cards.length.to_f / cards.length * 100).round(2)

  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.append(card)
  end

end
