class Deck 
attr_reader :cards 
            :high_rankers

def initialize(cards)
    @cards = cards 
end 

def cards
    @cards
end 

def rank_of_card_at(index) 
   @cards[index].rank

end 

def high_ranking_cards 
@high_rankers = []
    @cards.each do |card|
    if card.rank >= 11 
        @high_rankers << card 
    end 
end 
return high_rankers
end 

def percent_high_ranking
    @high_rankers.count / @cards.count 
end 

def remove_card
    @cards = @cards.shift
end 

def add_card(card) 
    @cards = @cards.append(card)
end 

end 