class Player

attr_reader :name, :deck
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    false # interaction pattern states a return of false
  end

  def remove_card
    @deck.cards.shift # deck containing card array has first card array removed
  end
end
