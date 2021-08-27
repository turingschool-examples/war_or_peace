

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    # @rank_of_card_at = rank
    # @high_ranking_cards = []
    # @percent_high_ranking = percent
    # @remove_card = remove_car
    # @add_card = add_card
  end


  def rank_of_card_at(index)
   cards[index].rank
  end
end
#   def high_ranking_cards
#     cards.map do |card|
#       if rank >= 10
#
#   end
# end
