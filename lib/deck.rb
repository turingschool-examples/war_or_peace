
class Deck
  attr_reader :cards
  def initialize(cards = [])
    @cards = cards
    @card_rank_values = {
      2 => "2",
      3 => "3",
      4 => "4",
      5 => "5",
      6 => "6",
      7 => "7",
      8 => "8",
      9 => "9",
      10 => "10",
      11 => "Jack",
      12 => "Queen",
      13 => "King",
      14 => "Ace"
    }
    @high_rank = []
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    @cards.each do |card|
        if card.rank > 10
          @high_rank << card
    end
  end
end
