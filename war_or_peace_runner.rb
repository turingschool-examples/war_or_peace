class Start
    attr_reader :deck1, :deck2, :standard_deck
    def initialize(standard_deck)
        @standard_deck = @standard_deck
        @deck1 = []
        @deck2 = []
    end
    
    def start 
        standard_deck.shuffle
        standard_deck.each_slice(2).to_a
        deck1 << standard_deck[0]
        deck2 << standard_deck[1]
    end
end

