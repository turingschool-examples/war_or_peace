#'./lib/player.rb'

class Player
  attr_reader :name, :deck
  def initialize( name, deck)

    @name = name
    @deck = deck
  end

  #If player has no cards left in thier deck they lose the geme
  def has_lost?

    if @deck.cards != []
      return false
    end
      return true

  end

end
