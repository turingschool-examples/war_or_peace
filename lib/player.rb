class Player

attr_reader :name,
            :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

#this determines when the player loses
#could this piece of code work?(found online) ask instructor
  def lost?
    @deck.cards.length == 0
  end

end
