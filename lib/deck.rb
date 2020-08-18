class Deck
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @rank_of_card_at = rank_of_card_at
    @high_ranking_cards = high_ranking_cards

  end
end
