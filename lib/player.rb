class Player
  attr_reader :name,
              :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
    @has_lost = false
  end

  def has_lost?
   if deck.cards.count > 0
     @has_lost
     deck.remove_card
   else
    @has_lost = true
   end
 end
end
