class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
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
end
