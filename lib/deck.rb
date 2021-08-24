class Deck
  attr_reader :cards #Array of Card objects
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(i)
    @cards[i].rank
  end

  def high_ranking_cards
    # could not get drop_while to function as expected
    #@cards.drop_while{|card| card.rank < 11}

    temp = []
    @cards.each{|card|
    if card.rank >= 11
      temp << card
    end
    }
    return temp
  end

  def percent_high_ranking
    ((self.high_ranking_cards.length.to_f / @cards.length.to_f) * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end


end
