class Player

attr_reader :name,
            :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

#this determines when the player loses
#the method is counting the amount of cards the player holds
#when that is equal to 0 the player then loses the game
  def lost?
    @deck.cards.length == 0
  end

end
