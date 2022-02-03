class Deck
  attr_reader :cards, :deck
  
  
  def initialize(cards)
    @cards = cards

  
  
  
    def rank_of_card_at(index)
      deck[@card.rank]
    end
  end 
end
  # def high_ranking_cards
  #   if rank >= 11
  #     high_rank = []
