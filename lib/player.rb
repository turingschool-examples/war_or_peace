class Player
   #attr_reader allows accees to name and deck
  attr_reader :name
              :deck

    def initialize(name, deck)
      @name = name
      @deck = deck
    end
end
