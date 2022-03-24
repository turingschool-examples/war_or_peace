require '.lib/card.rb'
class Deck
  attr_reader :cards, :rank
  def initialize(array_of_cards)
    @cards = array_of_cards
  end

  def rank_of_card_at(rank)
    @rank = rank

  end

  def high_ranking_cards(cards)
    high_rank = []
    @cards.each do |card|
      if card.rank > 10
        high_rank << card
      end
    end

  end


  def percent_high_ranking


  end

  def remove_card
    @cards.pop

  end

  def add_card

  end

end
