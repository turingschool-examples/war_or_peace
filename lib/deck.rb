require './lib/card'
require 'pry'

class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        @cards[index].rank
    end

    def high_ranking_cards
        high_cards = [11, 'Jack', 'Queen', 'Ace', 'King']
        new_array = []
        @cards.each do |card|
            if high_cards.include?(card.value)
                new_array << card
            end
        end
        # binding.pry
        return new_array
    end

    
    def percent_high_ranking
        percent = (high_ranking_cards.count.to_f / @cards.count.to_f).round(2) * 100
        # binding.pry
        return "#{percent.to_i}%"
    end

    def remove_card
        @cards.shift
    end

    def add_card(card)
        @cards << card
    end
end


card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3) 
card3 = Card.new(:heart, 'Ace', 14)
cards = [card1, card2, card3]
deck = Deck.new(cards)

# puts deck.cards[0].rank
# puts deck.high_ranking_cards
# puts deck.percent_high_ranking
puts deck.cards
puts "------------"
deck.remove_card
puts deck.cards
puts "------------"
card4 = Card.new(:club, '5', 5)
deck.add_card(card4)
puts deck.cards