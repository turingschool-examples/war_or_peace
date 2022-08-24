class Deck
  attr_reader :cards, :rank_of_card_at, :high_ranking_cards, :percent_high_ranking
  def initialize(cards, rank_of_card_at, high_ranking_cards, percent_high_ranking)
    @cards = cards
    @rank_of_card_at = rank_of_card_at
    @high_ranking_cards = high_ranking_cards
    @percent_high_ranking = percent_high_ranking
  end

  def rank_of_card_at
    @card(2)
    if @card(2) >= 11
  end

end
