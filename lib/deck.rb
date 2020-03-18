class Deck
  attr_reader :cards

  def initialize (card)
    @cards = card
    @rank
  end

  def rank_of_card_at()
    cards.@rank[]
  end

  def high_ranking_cards
    high_rank = []
    if @cards >= 11 || @cards = 'Queen', 'King', 'Jack'
      high_rank << @cards
    end
    high_rank
  end
end
