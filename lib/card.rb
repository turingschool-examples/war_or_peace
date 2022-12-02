class Card
    
    #allows us to read these attributes outside of the class
    attr_reader :suit, 
                :value, 
                :rank

    #allows us to create a new instance of the variable (instanciation)
    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
    end

   
end