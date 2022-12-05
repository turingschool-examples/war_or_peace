class Deck
    attr_reader :cards

    def initialize(cards)
        # require "pry"; binding.pry
        @cards = cards
    end

    def rank_of_card_at(index)
        @cards[index].rank
        #  require "pry"; binding.pry
    end

    def high_ranking_cards
        pile = []
        @cards.each do |card|
            if card.rank >= 11
                pile << card
            end
        end
        pile
    end

    def percent_high_ranking 
        ((high_ranking_cards.size * 100) / cards.size.to_f).round(2)   
    end


    def remove_card
       @cards.shift
    end 

    def add_card(new_card)
        cards.push (new_card)
    end

    

end    


# class Dog
#     def initialize
#     end

# end

# Dog.new

# def say_hello(name)
#     puts "Hello #{name}"
# end

# say_hello("Luke")