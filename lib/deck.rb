class Deck
  attr_reader :cards,
              :high_ranking_cards

  def initialize(cards)
    @cards = cards
    @high_ranking_cards = high_ranking_cards
  end

  def rank_of_card_at(num)
    cards[num].rank
  end

  def high_ranking_cards
    face_cards = []

    cards.each do |card|
      if card.rank > 10
      face_cards << card
      end
    end
    face_cards
  end

  def percent_high_ranking
    ((high_ranking_cards.count / cards.count.to_f) * 100).round(2)
  end
end
