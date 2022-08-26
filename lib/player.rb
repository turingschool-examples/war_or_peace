class Player
   #attr_reader allows accees to name and deck
  attr_reader :name #attr_reader = methods for class
              :deck

    def initialize(name, deck) #parameters
      @name = name   #instance variables
      @deck = deck
    end

     def has_lost?
          false
  end

end
