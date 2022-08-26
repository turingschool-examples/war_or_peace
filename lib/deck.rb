class Deck
  attr_reader :cards, :add_to_deck

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @high_rank_cards = []
    @cards.each do |card|
      if card.rank >= 11
        @high_rank_cards << card
      end
    # require "pry";binding.pry
  end

  end


  #   @rank_of_card_at = rank_of_card_at
  #   @high_ranking_cards = []
  #   @percent_high_ranking = percent_high_ranking
  #   @remove_card = remove_card
  #   @add_card = add_card
end
