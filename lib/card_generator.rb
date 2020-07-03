class CardGenerator

  attr_reader :results, :file

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
  end

  def show_text_file
    @results
  end

  def show_each_character_by_type
    all_cards = @results.split("\n")
    p cards[0]
  end
end

new_cards = CardGenerator.new
new_cards.show_each_character_by_type
