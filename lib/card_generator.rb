require_relative 'card'
require_relative 'deck'

class CardGenerator
  attr_reader :deck1,
              :deck2,
              :cards,
              :filename

  def initialize(filename)
    @cards =  []
    @deck1 = []
    @deck2 = []
    @filename = filename
    create_cards
  end

  def create_cards
    file = File.open(filename)
    file.each_line do |line|
      line_arr = line.split(",").map(&:strip)
      card = Card.new(line_arr[1].to_sym, line_arr[0].to_s, line_arr[2].to_i)
      cards << card
    end
    cards
  end

  def create_decks
    shuffled_deck = @cards.shuffle
    cards1 = []
    cards2 = []
    52.times do |num|
      if num.even?
        cards1 << shuffled_deck[num]
      elsif num.odd?
        cards2 << shuffled_deck[num]
      end
      shuffled_deck.slice(num)
    end
    @deck1 = Deck.new(cards1)
    @deck2 = Deck.new(cards2)
  end
end
