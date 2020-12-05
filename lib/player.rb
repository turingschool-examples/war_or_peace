class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # require "pry"; binding.pry
    if deck.cards[-1].rank == 14
      return false
    end
  end

  # def has_lost?
  #   require "pry"; binding.pry
  #   false
  # end
  # def has_lost? #This is not my code. I understand how it works,
  #   #but I may need to find one that's closer to what
  #   #I would come up with.
  #   if @deck.cards.length == 52
  #     p "*~*~*~* #{self.name} has won the game! *~*~*~*"
  #   elsif @deck.cards.length > 1
  #     false
  #   elsif @deck.cards.length < 1
  #     true
  #   end
  # end
end
