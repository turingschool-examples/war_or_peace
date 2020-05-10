class CardGenerator
  attr_reader :suits_arr, :i


  def initialize(i)
    @i = i #gets.chomp
    @suits_arr = []
  end

  def hi
    "hello"
  end

  def move_it
    @suits_arr << @i
  end

end


# puts "Hello. Let's build a deck of cards.
# puts "This program will generate a text file."
# puts "Continue? [Y]es / [N]o"
# puts "Pick a deck style: [S]tandard / [T]arot
# puts "What do you want to name this file?"
# puts "Generated #{style} deck.... at #{name}.txt"
