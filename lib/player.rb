class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  # def player_has_lost?
  #   has_lost == false
  #   @cards.shift
  #   p "Keep Going!"
  # end
  #
  # def remove_card_from_deck
  #   if has_lost == false
  #     @cards.shift
  #     p cards
  #   end
  # end
end
