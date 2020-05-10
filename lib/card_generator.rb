class CardGenerator
  attr_reader :suits, :i, :royal


  def initialize(i)
    @i = i #gets.chomp
    @suits = []
    @royal = ["King", "Queen", "Jack"]
  end

  def hi
    "hello"
  end

  def move_it
    @suits << @i
  end

  def standardize
    @suits = standard_suits
  end

  def standard_suits
    [:club, :spade, :heart, :diamond]
  end

  def tarotize
    @suits = tarot_suits
    @royal << "Knight"
  end

  def tarot_suits
    [:cup, :wand, :coin, :sword]
  end

  def aces_high?
    @suits == standard_suits
  end

  def ace
    ["Ace"]
  end

end


# puts "Hello. Let's build a deck of cards.
# puts "This program will generate a text file."
# puts "Continue? [Y]es / [N]o"
# puts "Pick a deck style: [S]tandard / [T]arot Minor Arcana
# puts "What do you want to name this file?"
# puts "Generated #{style} deck.... at #{name}.txt"
