
class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_location)
    cards[index_location].rank
  end

  def high_ranking_cards()
    cards.find_all do |card|
      card.rank > 10
  end

  def percent_high_ranking()
    high_rank = []
    cards.each do |card|
      if card.rank > 10
        high_rank.push(card)
      end
    end
    percent = high_rank.length.to_f/cards.length.to_f
    (percent * 100).round(2)
  end

  def remove_card()
    cards.shift
  end

  def add_card(new)
    cards.push(new)
  end

end
end
