class Player
  attr_reader :name, :deck #lets you read attributes

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.length > 0
      false
    else
      puts "*~*~*~* #{@name} has won the game! *~*~*~*"
      true
    end
  end
end
