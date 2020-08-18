class Deck
  attr_reader :cards
    def initialize(cards = [])
      @cards = cards
    end

    def rank_of_card_at(index)
      cards[index].rank
    end

    def high_ranking_cards
      @cards.select do |card|
          card.rank >= 11
      end
    end

    def percent_high_ranking
    (self.high_ranking_cards.count.to_f / @cards.count).round(2)
    end

    def remove_card
      @cards.shift
    end

    def add_card(card)
      deck << card
    end


end
