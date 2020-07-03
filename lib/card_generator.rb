class CardGenerator
  attr_reader :results, :file
  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
  end

  def show_text_file
    p @results
  end
end

new_cards = CardGenerator.new

new_cards.show_text_file
