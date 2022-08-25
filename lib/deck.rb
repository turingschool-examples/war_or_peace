class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = []
  end

  def add_to_deck(card)
    @cards << card
  end
#     @rank_of_card_at = rank_of_card_at
#     @high_ranking_cards = []
#     @percent_high_ranking = percent_high_ranking
#     @remove_card = remove_card
#     @add_card = add_card
#   end
#
#   def @rank_of_card_at
#     card(0..2)
#   end
#
    def high_ranking_cards(card)
      high_ranking_cards = [@card1, @card3]
      @cards.each do |card|

   #   high_ranking_cards = @cards.select do |card|
   #     card.rank >= 11
      end
   end
#
#       @high_ranking_cards << card
#
# end
end
