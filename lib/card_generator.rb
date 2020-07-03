class CardGenerator

  attr_reader :results, :file
  attr_accessor :all_cards

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
    @all_cards = @results.split("\n")
  end

  def show_text_file
    @results
  end

end

# new_cards = CardGenerator.new
# new_cards.show_each_card
