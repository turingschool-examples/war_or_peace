require "./card"

class CardGenerator
  attr_accessor :filename, :final_deck
  def initialize(filename)
    @filename = filename
    @final_deck
  end

  def cards
    file_data = File.read(filename).split
    clean_data = []
    file_data.each {|line| line.delete ","}

    while file_data.count > 1
      clean_data.push(file_data.shift(3))
    end

    clean_data.each do |arr|
      arr[2] = arr[2].to_i
    end

    new_deck = []
    clean_data.each do |card|
      new_deck.push([card[1], card[0], card[2]])
    end

    final_deck = []
    new_deck.each do |card|
      i = Card.new(card[0], card[1], card[2])
      final_deck.push(i)
    end
    return final_deck
  end
end

# cards = CardGenerator.new("cards.txt")
# deck = cards.cards

# make_new = []
# deck.each {|thing| thing.delete! ","}

# while deck.count > 1
#   make_new.push(deck.shift(3))
# end

# make_new.each do |arr|
#   arr[2] = arr[2].to_i
# end

# a_whole_deck = []
# make_new.each do |card|
#   a_whole_deck.push([card[1], card[0], card[2]])
# end

# deck_deck = []
# a_whole_deck.each do |card|
#   i = Card.new(card[0], card[1], card[2])
#   deck_deck.push(i)
# end