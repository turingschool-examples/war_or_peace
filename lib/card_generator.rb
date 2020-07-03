class CardGenerator

  attr_reader :results, :file,

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
  end

  def show_text_file
    @results
  end

  def show_each_character_by_type
    @results.split("\n").collect{|x| sep = x.split(" ")
      values = sep[0]
      ranks = sep[2]
      suits = sep[1]
}
  end
end

new_cards = CardGenerator.new
new_cards.show_each_character_by_type
