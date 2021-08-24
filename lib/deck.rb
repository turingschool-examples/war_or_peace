class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end
  def rank_of_card_at(position)
    @position = position
    cards[position.to_i].rank
  end
  def high_ranking_cards
    high_rank_cards = []
    cards.each do |card|
      if card.rank >= 11
        high_rank_cards << card
      else
      end
    end
  end
end

# what I've figured out so far
# calling the cards variable allows us to call the specific card
