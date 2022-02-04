
class Deck

  attr_reader :cards

  def initialize(start_cards)

    @cards = start_cards

  end

  def rank_of_card_at(place)
      @cards[place]
  end

  def high_ranking_cards
    high_cards = []

    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    high_cards
  end

  def percent_high_ranking
    high_cards = []

    cards.each do |card|
      if card.rank >= 11
        high_cards << card
      end
    end
    total_cards = cards.count
    total_high_cards = high_cards.count

    percent_high_rank = total_high_cards.to_f / total_cards
    percent_high_rank = percent_high_rank.round(4) * 100
  end



  def remove_card
    @cards.shift
  end


  def add_card
    @cards.append
  end

end
