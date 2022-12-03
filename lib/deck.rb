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
        high_rank_card_counter = 0
            @cards.each do |card|
                if card.rank >= 11
                    high_rank_card_counter += 1     
                end
            end 
        float = (high_rank_card_counter/3.to_f * 100).round(2)    
    end


    def remove_card
        @cards.shift
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