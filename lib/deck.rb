class Deck
  attr_reader :cards,
              :rank

  def initialize (cards)
    @cards              = cards
    @rank               = rank
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards

    high_ranking_cards = []

    cards.each do |card|
      if @rank >= 11
        high_ranking_cards << card
      end
    end

    high_ranking_cards
  end

  def percent_high_ranking
    high_ranking_cards.count / @cards.count * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    cards.append(card)
  end

end
