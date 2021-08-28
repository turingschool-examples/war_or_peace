require './lib/card.rb'



class Deck
   attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_cards_at(card_index)
    @card_index = card_index
    cards[card_index].rank
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank >= 12
    end
  end


  def percent_high_ranking
    high_ranking_cards.length.to_f / cards.length.to_f * 100
  end

  def remove_card
    cards.shift
    @cards
  end

  def add_card(new_card)
    cards.push(new_card)
  end

  def is_empty?
    cards.length == 0
  end



end
