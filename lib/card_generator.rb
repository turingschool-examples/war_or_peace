require './lib/card'

class CardGenerator
attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
    @suits = [:heart, :diamond, :spade, :club]
    @values = ['2', '3', '4', '5', '6', '7', '8',
              '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  end

  def set_cards
    File.open(filename).each do |line|
      info = line.chomp.split(', ')
      value = info[0]
      suit = ''

      if info[1] == 'Heart'
        suit = :heart
      elsif info[1] == 'Diamond'
        suit = :diamond
      elsif info[1] == 'Spade'
        suit = :spade
      else suit = :club
      end
      rank = info[2].to_i
      card = Card.new(suit, value, rank)
      @cards << card
    end
  end

  # COULDN'T GET THIS MEHTHOD WORKING
  # *********************************
  def generate_cards_file
    @suits.each do |suit|
      count = 1
      @values.each do |value|
        File.open(filename, 'w+').each do |line|
          puts "#{value}, #{suit}, #{count}"
          line.puts "#{value}, #{suit}, #{count}"
        end
        count += 1
      end
    end
  end
end
