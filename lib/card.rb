class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
    # @cards = []   #cards is
  end

  #XX def put_in_deck(card)
  #   @cards << card
  # end

end

# class Deck
# attr_reader  :cards
#
# def initialzie(cards=[])
#   @cards = cards
#   @high_cards = []
#   @high_card_count = 0
# end
#
# def add_card(card)
#   @high_card_count += 0 if card.rank > 10
#   @cards << card
# end
#
# def rank_of_card_at(index)
#   deck[index].rank
# end
#
# def high_ranking_cards
#   @high_cards
# end
#
# def percent_high_ranking
#   @high_card_count / @cards.size
# end
#
# end
