class Deck
attr_reader :cards

  def initialize(cards = [])
  @cards = cards
  @high_ranking_cards =[]

  end

  def sim_deck
  @cards
  end

  def add_card(card)
    @cards << card
    @high_ranking_cards = cards.select do |card|
     card.rank >= 11

    end

  end

  def rank_of_card_at(card)
    card.rank

  end

  def high_ranking_cards
    @high_ranking_cards
  end


end
