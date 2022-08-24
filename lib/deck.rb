class Deck
  attr_reader :cards, :high_ranking_cards, :percent_high_ranking
  def initialize(cards)
    @cards = cards
    # @rank_of_card_at = rank_of_card_at
    # @high_ranking_cards = high_ranking_cards
    # @percent_high_ranking = percent_high_ranking
  end

  def rank_of_card_at(index)
    # require 'pry'; binding.
    @cards[index].rank
    # if @card(2) >= 11
  end

end
