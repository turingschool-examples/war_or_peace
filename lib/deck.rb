class Deck
attr_reader  :cards

  def initialize(cards)
    @cards = cards
  end

  # def high_ranking_cards
  #   @cards.find_all do |card|
  #     require "pry"; binding.pry
  #   end
  # end

end
