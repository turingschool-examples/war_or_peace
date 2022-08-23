class Deck
attr_reader :cards

  def initialize(cards = [])
  @cards = cards
  @high_rank = false
  @high_ranking_cards =[]

  end

  def sim_deck
  @cards
  end

  def add_card(card)
    @cards << card
    if card.rank >= 11
      @high_rank = true
      @high_ranking_cards << card
    else
      false
    end

  end

  def rank_of_card_at(card)
    card.rank

  end

  def high_ranking_cards
    @high_ranking_cards
  end


end
