class CardGenerator

  attr_reader :results
  attr_accessor :all_cards

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
    @all_cards = @results.split("\n")
  end

  def show_text_file
    @results
  end

  def shuffle_cards
    @all_cards.shuffle
  end

end

# new_cards = CardGenerator.new
# p new_cards.all_cards == new_cards.shuffle_cards
