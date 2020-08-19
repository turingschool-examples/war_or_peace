

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards.at(index).rank
  end

  def high_ranking_cards
    #iterate over the deck to find rank above 11
    #move cards rank above 11 into a new array
    high_cards = []

    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    p high_cards
  end

  def percent_high_ranking
    percent = high_ranking_cards.count / cards
    puts percent
  end

  def remove_card
  end

  def add_card
  end

end
