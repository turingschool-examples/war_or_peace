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
    # suits = [:heart, :diamond, :club, :spade]
    # card_values= {
    #   2 => '2',
    #   3 => '3',
    #   4 => '4',
    #   5 => '5',
    #   6 => '6',
    #   7 => '7',
    #   8 => '8',
    #   9 => '9',
    #   10 => '10',
    #   11 => 'Jack',
    #   12 => 'Queen',
    #   13 => 'King',
    #   14 => 'Ace'
    # }
    # suits.each do |suit|
    #   card_values.each do |card_value, card_key|
    #     @main_deck << Card.new(suit, card_value, card_key)
    #   end
    # end
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
