class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    deck.cards.length == 0
  end

  def print_info
    puts "#{name}'s deck:"
    @deck.print_info
  end
end
