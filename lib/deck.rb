#deck class file
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def high_ranking_cards
    high_ranking_cards = []
      cards.each do |card|
        if card.rank > 10
          high_ranking_cards << card
        end
      end
      return high_ranking_cards
    end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def percent_high_ranking()
    #counts items in high rank cards array and divides by total cards, then
    #multiplies by 100 to get percentage, and rounds to 2 decimals.
    ((high_ranking_cards.count.to_f / @cards.count.to_f) * 100).round(2)
  end

  def remove_card()
    @cards.shift
    #.shift removes first item in array
  end

  def add_card(new)
    @cards << new
  end
end
