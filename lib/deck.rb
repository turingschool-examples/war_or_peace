class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    @cards[position].rank
  end

  def high_ranking_cards
    high_ranking_cards = []
    @cards.each do |card|
      if card.rank > 10
        high_ranking_cards << card
      end
    end
    high_ranking_cards
  end

  def percent_high_ranking
    # (high_ranking_cards / cards) * 100
    percent = ((high_ranking_cards.size.to_f / cards.size.to_f) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card
  end


  #def high_ranking_cards
    #@cards.find_all do |card|
      #card.rank > 11
    #end
  #end

end
