class Deck
  attr_reader :cards
  
  
  def initialize(deck)
    @deck = []
  end
  
  def rank_of_card_at[] 
    returns card.rank
  end
  
  def high_ranking_cards
    if rank >= 11
      high_rank = []
