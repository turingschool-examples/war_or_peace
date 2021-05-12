class Deck
  attr_reader :cards,
              :rank_of_card_at,
              :index,
              :high_ranking_cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @index = index
    @rank_of_card_at = cards[index].rank
  end

  def high_ranking_cards
    @high_ranking_cards = []
    cards.each_with_index do |card, index|
      if rank_of_card_at(index) >= 11
        puts "this is a high card"
      else
        puts "this is not a high card"
      end
    end
  end

  def remove_card
    @remove_card = cards.shift
  end

  def add_card(new_card)
    @add_card = cards.append(new_card)
  end
end
