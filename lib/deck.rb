class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def rank_of_card_at(num_param)
    @cards[num_param].rank
  end

  def high_ranking_cards
    high_rank = []

    @cards.each do |card|
      if card.rank > 11
        high_rank << card
      end
    end
    high_rank
  end

#new comment

  # def percent_high_ranking
  #   ranks = []
  #   total_rank_sum = 0
  #   high_ranks = []
  #   high_rank_cards_sum = 0
  #
  #   @cards.each do |card|
  #     ranks << card.rank
  #   end
  #
  #   ranks.each do |rank|
  #     total_rank_sum += rank
  #   end
  #
  #   @cards.each do |card|
  #     if card.rank > 11
  #       high_ranks << card.rank
  #     end
  #   end
  #
  #     high_ranks.each do |high_rank|
  #       high_rank_cards_sum += high_rank
  #     end
  # end
end
