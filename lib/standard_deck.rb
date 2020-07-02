require_relative "./card"
class StandardDeck
 attr_reader  :ranks,
              :values,
              :suits,
              :num_of_cards,
              :all_cards
  def initialize(all_cards_info)
    @ranks = all_cards_info["ranks"]
    @values = all_cards_info["values"]
    @suits = all_cards_info["suits"]
    @num_of_cards = (1..52).to_a
    @all_cards = []
  end

  def create_deck
    card_names = @num_of_cards.map do |num|
      @all_cards << "card#{num}"
    end

    @all_cards.each do |card|
      require "pry"; binding.pry
    end

  end


end
