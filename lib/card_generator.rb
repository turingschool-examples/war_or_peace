# frozen_string_literal: true

class CardGenerator
  def initialize(file)
    @card_file = file
  end

  def cards
    File.readlines(@card_file).map do |line|
      value, suit, rank = line.split(', ')
      Card.new(suit.to_sym, value, rank.to_i)
    end
  end

  def shuffled_cards
    cards.shuffle
  end

  def deck_one
    shuffled_cards[0..25]
  end

  def deck_two
    shuffled_cards[26..52]
  end
end
