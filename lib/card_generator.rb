class CardGenerator

  attr_reader :results
  attr_accessor :all_cards, :shuffled

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
    @all_cards = @results.split("\n")
    @suffled = @all_cards.shuffle
  end

  def show_text_file
    @results
  end



end

new_cards = CardGenerator.new
p new_cards.all_cards.shuffle
