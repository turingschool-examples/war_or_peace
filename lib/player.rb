class Player
  attr_accessor :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  # def can_player_lose?

  def player_has_lost?
    if player_has_lost == false
    cards.shift
    end
  end

  # def remove_card_from_deck
  #   if has_lost == false
  #     @cards.shift
  #     p cards
  #   end
  # end
end
