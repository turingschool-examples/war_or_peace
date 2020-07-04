class CardGenerator

  attr_reader :results
  attr_accessor :all_cards, :suit, :value, :rank, :card_values_split

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
    @all_cards = @results.split(/\n/)
    @card_values_split = all_cards.collect{ |x| x.split(", ")}
    @suit = @card_values_split.collect{ |x| x[1]}
    @value = @all_cards.collect{ |x| x[0] }
    @rank = @card_values_split.collect{ |x| x[2]}
    # shuffled_deck = new_cards.all_cards.shuffle
    # half_deck1 = shuffled_deck.pop(26)
    # half_deck2 = shuffled_deck
  end

  def show_text_file
    @results
  end

end

new_cards = CardGenerator.new
# shuffled_deck = new_cards.all_cards.shuffle
# half_deck1 = shuffled_deck.pop(26)
# half_deck2 = shuffled_deck
p new_cards.rank
