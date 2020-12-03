require_relative 'card'
require_relative 'deck'

class CardGenerator
  attr_reader :deck1, :deck2, :main_deck

  def initialize
    @main_deck =  []
    @deck1 = []
    @deck2 = []
  end

  def create_cards
    suits = [:heart, :diamond, :club, :spade]
    card_values= {
      2 => '2',
      3 => '3',
      4 => '4',
      5 => '5',
      6 => '6',
      7 => '7',
      8 => '8',
      9 => '9',
      10 => '10',
      11 => 'Jack',
      12 => 'Queen',
      13 => 'King',
      14 => 'Ace'
    }
    suits.each do |suit|
      card_values.each do |card_value, card_key|
        @main_deck << Card.new(suit, card_value, card_key)
      end
    end
  end

  def create_decks
    shuffled_deck = @main_deck.shuffle
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
