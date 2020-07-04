class CardGenerator

  attr_reader :results, :rank
  attr_accessor :cards_split, :suit, :value, :card_values_split, :card1, :number, :cards, :card

  def initialize
    file = File.open("./lib/cards.txt")
    @results = file.read
    @cards_split = @results.split(/\n/)
    @card_values_split = @cards_split.collect{ |x| x.split(", ")}
    @card = card
  end

  def card_suit(number)
    @card_values_split[number][1]
  end

  def card_rank(number)
    @card_values_split[number][0]
  end

  def card_value(number)
    @card_values_split[number][2]
  end
end

new_cards = CardGenerator.new
# shuffled_deck = new_cards.all_cards.shuffle
# half_deck1 = shuffled_deck.pop(26)
# half_deck2 = shuffled_deck
p new_cards.card_value(0)
