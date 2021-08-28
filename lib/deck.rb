class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    require 'pry'; binding.pry
  end
  # def rank_of_card_at(index)
  # end
  #
  # def high_ranking_cards
  # end
  #
  #   # high_ranking_cards = []
  #   #
  #   # @cards.each do |card|
  #   #   if @rank >= 11
  #   #     high_ranking_cards << card
  #   #   end
  #   # end
  #
  #
  #
  #
  # def percent_high_ranking
  # end
  #
  # def remove_card
  #   @cards.shift
  # end
  #
  # def add_card
  #   @cards.push
  # end
end
